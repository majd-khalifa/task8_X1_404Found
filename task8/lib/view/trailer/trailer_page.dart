// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:task8/view/trailer/cubit/trailer_cubit.dart';
import 'package:task8/view/trailer/cubit/trailer_state.dart';

class TrailerPage extends StatelessWidget {
  final int movieId;
  final String? title;
  final String? posterUrl;

  const TrailerPage({
    super.key,
    required this.movieId,
    this.title,
    this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrailerCubit()..loadTrailer(movieId),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          final cubit = context.read<TrailerCubit>();

          return Scaffold(
            backgroundColor: Colors.black,
            body: GestureDetector(
              onTap: () {
                if (state.controller != null &&
                    state.controller!.value.isPlaying) {
                  cubit.toggleControls();
                }
              },
              child: Stack(
                children: [
                  Positioned.fill(child: _buildContent(context, state, cubit)),

                  // HEADER
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.4),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _headerButton(
                              icon: Icons.keyboard_arrow_down,
                              onTap: () => Navigator.pop(context),
                            ),
                            Column(
                              children: [
                                Text(
                                  (title ?? "TRAILER").toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "Official Trailer",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            _headerButton(icon: Icons.cast, onTap: () {}),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // CONTROLS
                  if (state.showControls && state.controller != null)
                    _buildControls(context, state, cubit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ---------------- CONTENT ----------------

  Widget _buildContent(
    BuildContext context,
    TrailerState state,
    TrailerCubit cubit,
  ) {
    // 1) تحميل
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF7f13ec)),
      );
    }

    // 2) لا يوجد تريلر
    if (state.trailerUrl == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.video_library_outlined,
              size: 100,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 20),
            Text(
              "لا يوجد تريلر",
              style: TextStyle(fontSize: 18, color: Colors.grey[400]),
            ),
          ],
        ),
      );
    }

    // 3) قبل أول Play فقط → صورة الفيلم
    if (!state.hasPlayedOnce) {
      return _posterPreview(cubit);
    }

    // 4) بعد أول Play → YoutubePlayer دائمًا
    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: YoutubePlayer(
            controller: state.controller!,
            showVideoProgressIndicator: false,
            onReady: () {},
            onEnded: (_) => cubit.onVideoEnded(),
          ),
        ),
      ),
    );
  }

  Widget _posterPreview(TrailerCubit cubit) {
    return GestureDetector(
      onTap: cubit.togglePlayPause,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            posterUrl ?? "",
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey[900],
              child: const Center(
                child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF7f13ec).withOpacity(0.9),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- CONTROLS ----------------

  Widget _buildControls(
    BuildContext context,
    TrailerState state,
    TrailerCubit cubit,
  ) {
    final controller = state.controller!;
    final pos = controller.value.position;
    final dur = controller.value.metaData.duration;
    final progress = dur.inSeconds == 0 ? 0.0 : pos.inSeconds / dur.inSeconds;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 40,
          top: 60,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.95),
              Colors.black.withOpacity(0.85),
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          children: [
            // Progress Bar
            Row(
              children: [
                Text(
                  _format(pos),
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      final width = MediaQuery.of(context).size.width * 0.76;
                      final dx =
                          details.globalPosition.dx -
                          (MediaQuery.of(context).size.width * 0.12);
                      final percent = (dx / width).clamp(0.0, 1.0);
                      final newPos = Duration(
                        seconds: (percent * dur.inSeconds).toInt(),
                      );
                      controller.seekTo(newPos);
                    },
                    child: Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width *
                                0.76 *
                                progress,
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFF7f13ec),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  _format(dur),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 11,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left
                Row(
                  children: [
                    _controlButton(
                      icon: state.isMuted ? Icons.volume_off : Icons.volume_up,
                      onTap: cubit.toggleMute,
                    ),
                    const SizedBox(width: 24),
                    _controlButton(icon: Icons.closed_caption, onTap: () {}),
                  ],
                ),

                // Center
                Row(
                  children: [
                    _controlButton(
                      icon: Icons.replay_10,
                      onTap: cubit.seekBackward,
                    ),
                    const SizedBox(width: 32),
                    GestureDetector(
                      onTap: cubit.togglePlayPause,
                      child: Icon(
                        controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 32),
                    _controlButton(
                      icon: Icons.forward_10,
                      onTap: cubit.seekForward,
                    ),
                  ],
                ),

                // Right
                Row(
                  children: [
                    _controlButton(icon: Icons.settings, onTap: () {}),
                    const SizedBox(width: 24),
                    _controlButton(
                      icon: state.isFullscreen
                          ? Icons.fullscreen_exit
                          : Icons.fullscreen,
                      onTap: cubit.toggleFullscreen,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HELPERS ----------------

  Widget _headerButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _controlButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white.withOpacity(0.8), size: 24),
    );
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.inMinutes.remainder(60))}:${two(d.inSeconds.remainder(60))}";
  }
}
