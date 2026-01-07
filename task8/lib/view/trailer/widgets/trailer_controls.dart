// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'trailer_progress_bar.dart';

class TrailerControls extends StatelessWidget {
  final VideoPlayerController? controller;
  final bool initialized;
  final VoidCallback onPlayPause;

  const TrailerControls({
    super.key,
    required this.controller,
    required this.initialized,
    required this.onPlayPause,
  });

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.inMinutes.remainder(60))}:${two(d.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !initialized) {
      return const SizedBox.shrink();
    }

    final pos = controller!.value.position;
    final dur = controller!.value.duration;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 26),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // الوقت + البار
            Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    _format(pos),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TrailerProgressBar(
                    controller: controller,
                    initialized: initialized,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 40,
                  child: Text(
                    _format(dur),
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // أزرار التحكم
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // يسار
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.volume_up, color: Colors.white70),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.closed_caption,
                        color: Colors.white70,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

                // وسط
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay_10, color: Colors.white70),
                      onPressed: () {
                        final newPos = pos - const Duration(seconds: 10);
                        controller!.seekTo(
                          newPos > Duration.zero ? newPos : Duration.zero,
                        );
                      },
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      icon: Icon(
                        controller!.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 36,
                      ),
                      onPressed: onPlayPause,
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      icon: const Icon(Icons.forward_10, color: Colors.white70),
                      onPressed: () {
                        final newPos = pos + const Duration(seconds: 10);
                        controller!.seekTo(newPos < dur ? newPos : dur);
                      },
                    ),
                  ],
                ),

                // يمين
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white70),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.fullscreen, color: Colors.white70),
                      onPressed: () {},
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
}
