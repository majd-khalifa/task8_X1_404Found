// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:task8/data/movie_api.dart';

class TrailerPage extends StatefulWidget {
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
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  late YoutubePlayerController _youtubeController;
  bool isLoading = true;
  bool isPlaying = false;
  bool showControls = true;
  bool isMuted = false;
  bool isHoveringProgressBar = false;
  bool isFullscreen = false;
  String? trailerUrl;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  Future<void> _loadVideo() async {
    try {
      print('🎬 Loading trailer for movieId: ${widget.movieId}');
      final url = await MovieApi().getTrailerUrl(widget.movieId);
      print('🎥 Got trailer URL: $url');

      if (url != null && url.isNotEmpty) {
        final videoId = MovieApi.extractYoutubeVideoId(url);

        if (videoId != null && videoId.isNotEmpty) {
          print('🎞️ YouTube Video ID: $videoId');

          _youtubeController = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
              showLiveFullscreenButton: false,
              hideControls: true,
              enableCaption: true,
            ),
          );

          _youtubeController.addListener(() {
            if (mounted) {
              setState(() {});
            }
          });

          if (mounted) {
            setState(() {
              trailerUrl = url;
              isLoading = false;
            });
            print('YouTube player initialized');
          }
        } else {
          print('Failed to extract video ID');
          if (mounted) {
            setState(() => isLoading = false);
          }
        }
      } else {
        print(' No trailer available for this movie');
        if (mounted) {
          setState(() => isLoading = false);
        }
      }
    } catch (e) {
      print(' Exception in _loadVideo: $e');
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  void _togglePlayPause() {
    setState(() {
      if (_youtubeController.value.isPlaying) {
        _youtubeController.pause();
        showControls = true;
      } else {
        _youtubeController.play();
        _hideControlsAfterDelay();
      }
    });
  }

  void _toggleMute() {
    setState(() {
      if (isMuted) {
        _youtubeController.unMute();
        isMuted = false;
      } else {
        _youtubeController.mute();
        isMuted = true;
      }
    });
    _hideControlsAfterDelay();
  }

  void _seekBackward() {
    final currentPosition = _youtubeController.value.position;
    final newPosition = currentPosition - const Duration(seconds: 10);
    _youtubeController.seekTo(
      newPosition.isNegative ? Duration.zero : newPosition,
    );
    _hideControlsAfterDelay();
  }

  void _seekForward() {
    final currentPosition = _youtubeController.value.position;
    final duration = _youtubeController.value.metaData.duration;
    final newPosition = currentPosition + const Duration(seconds: 10);
    _youtubeController.seekTo(newPosition > duration ? duration : newPosition);
    _hideControlsAfterDelay();
  }

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _youtubeController.value.isPlaying) {
        setState(() => showControls = false);
      }
    });
  }

  void _toggleFullscreen() {
    setState(() => isFullscreen = !isFullscreen);

    if (isFullscreen) {
      // الدخول إلى الشاشة الكاملة
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      // الخروج من الشاشة الكاملة
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    _hideControlsAfterDelay();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    // إعادة تعيين الإعدادات عند الخروج
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          if (isPlaying && _youtubeController.value.isPlaying) {
            setState(() => showControls = !showControls);
            if (showControls) {
              _hideControlsAfterDelay();
            }
          }
        },
        child: Stack(
          children: [
            // المحتوى الرئيسي
            Positioned.fill(child: _buildContent()),

            // Top Nav Bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 16,
                  right: 16,
                  bottom: 8,
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
                    _buildIconButton(
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title?.toUpperCase() ?? 'TRAILER',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Official Trailer 2',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 11,
                              letterSpacing: 0.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    _buildIconButton(icon: Icons.cast, onPressed: () {}),
                  ],
                ),
              ),
            ),

            // Bottom Controls
            if (isPlaying && showControls)
              Positioned(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Progress Bar
                      MouseRegion(
                        onEnter: (_) =>
                            setState(() => isHoveringProgressBar = true),
                        onExit: (_) =>
                            setState(() => isHoveringProgressBar = false),
                        child: _buildProgressBar(),
                      ),

                      const SizedBox(height: 24),

                      // Control Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left Controls
                          Row(
                            children: [
                              _buildControlButton(
                                icon: isMuted
                                    ? Icons.volume_off
                                    : Icons.volume_up,
                                onPressed: _toggleMute,
                              ),
                              const SizedBox(width: 24),
                              _buildControlButton(
                                icon: Icons.closed_caption,
                                onPressed: () {},
                              ),
                            ],
                          ),

                          // Center Controls
                          Row(
                            children: [
                              _buildControlButton(
                                icon: Icons.replay_10,
                                onPressed: _seekBackward,
                                size: 24,
                              ),
                              const SizedBox(width: 32),
                              _buildPlayButton(),
                              const SizedBox(width: 32),
                              _buildControlButton(
                                icon: Icons.forward_10,
                                onPressed: _seekForward,
                                size: 24,
                              ),
                            ],
                          ),

                          // Right Controls
                          Row(
                            children: [
                              _buildControlButton(
                                icon: Icons.settings,
                                onPressed: () {},
                              ),
                              const SizedBox(width: 24),
                              _buildControlButton(
                                icon: isFullscreen
                                    ? Icons.fullscreen_exit
                                    : Icons.fullscreen,
                                onPressed: _toggleFullscreen,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    final position = _youtubeController.value.position.inSeconds;
    final duration = _youtubeController.value.metaData.duration.inSeconds;
    final progress = duration > 0 ? position / duration : 0.0;

    return Column(
      children: [
        Row(
          children: [
            Text(
              _formatDuration(_youtubeController.value.position),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  final newPosition =
                      (details.globalPosition.dx -
                          (MediaQuery.of(context).size.width * 0.12)) /
                      (MediaQuery.of(context).size.width * 0.76);
                  final clampedPosition = newPosition.clamp(0.0, 1.0);
                  final seekPosition = Duration(
                    seconds: (clampedPosition * duration).toInt(),
                  );
                  _youtubeController.seekTo(seekPosition);
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    height: 32,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        // Background track
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        // Progress fill
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
                        // Thumb
                        AnimatedScale(
                          scale: isHoveringProgressBar ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: Positioned(
                            left:
                                MediaQuery.of(context).size.width *
                                    0.76 *
                                    progress -
                                8,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              _formatDuration(_youtubeController.value.metaData.duration),
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPlayButton() {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Icon(
        _youtubeController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    double size = 24,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(icon, color: Colors.white.withOpacity(0.8), size: size),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
            border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF7f13ec)),
      );
    }

    if (trailerUrl == null) {
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
              'لا يوجد تريلر',
              style: TextStyle(fontSize: 18, color: Colors.grey[400]),
            ),
          ],
        ),
      );
    }

    if (isPlaying) {
      return Center(
        child: YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: false,
          onReady: () {
            print('YouTube player ready');
          },
          onEnded: (data) {
            print('Video ended');
            setState(() {
              isPlaying = false;
              showControls = true;
            });
          },
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          isPlaying = true;
          showControls = true;
        });
        _hideControlsAfterDelay();
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            widget.posterUrl ?? '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                ],
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
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7f13ec).withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
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
}
