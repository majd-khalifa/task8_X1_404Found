import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/data/movie_api.dart';

class TrailerPage extends StatefulWidget {
  final int movieId;
  final String title;
  final String subtitle;
  final String backgroundImage;

  const TrailerPage({
    super.key,
    this.movieId = 155, // Default Interstellar
    this.title = 'Interstellar',
    this.subtitle = 'Official Trailer',
    this.backgroundImage = '',
  });

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;
  String? _videoUrl;

  @override
  void initState() {
    super.initState();
    _fetchTrailerUrl();
  }

  Future<void> _fetchTrailerUrl() async {
    final api = MovieApi();
    _videoUrl = await api.getTrailerUrl(widget.movieId);
    if (_videoUrl != null) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(_videoUrl!))
        ..initialize().then((_) {
          setState(() {
            _isInitialized = true;
          });
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _playPause() {
    if (_controller == null || !_isInitialized) return;
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
        _isPlaying = false;
      } else {
        _controller!.play();
        _isPlaying = true;
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final bg = widget.backgroundImage.isEmpty
        ? 'https://lh3.googleusercontent.com/aida-public/AB6AXuBifEf4diB3P7ssMaJAP4KlOuld5CEwi0sUun2XcpVV2lXAycaXoO9QrcH-Pz75A2SxMM6EHV8X0qxZbN8_oyw5ebJYxBywiJ4G8gEIwYxswfkOu5soKAYFTiXlP-rYBECYnNLL8qwjYdCEkcJKiDDl3Lga-q0sf0wpQ4eeZ480e6W3F-LBQg6NkkHoUhJwVetpW5RHQnm9XqIgdcZXA54iPc5rzK6Yi4r_ag4R7TSQIJQgDArrudqoSPKvxpiIiLi3c30H4EHT2wcb'
        : widget.backgroundImage;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: _isPlaying && _isInitialized
                ? VideoPlayer(_controller!)
                : Image.network(bg, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha((0.45 * 255).round()),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title.toUpperCase(),
                        style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(widget.subtitle, style: AppTextStyles.textStyle12),
                    ],
                  ),
                  _circleButton(
                    child: const Icon(Icons.cast, color: Colors.white),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          if (!_isPlaying)
            Center(
              child: Container(
                width: 88.w,
                height: 88.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha((0.3 * 255).round()),
                      blurRadius: 30.r,
                      offset: Offset(0, 10.h),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 44.sp,
                    color: Colors.white,
                  ),
                  onPressed: _playPause,
                ),
              ),
            ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 26.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha((0.8 * 255).round()),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Text(
                          _controller != null && _isInitialized
                              ? _formatDuration(_controller!.value.position)
                              : '0:00',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: _ProgressBar(
                          controller: _controller,
                          isInitialized: _isInitialized,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 40.w,
                        child: Text(
                          _controller != null && _isInitialized
                              ? _formatDuration(_controller!.value.duration)
                              : '0:00',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up,
                              color: Colors.white70,
                            ),
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
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                constraints: const BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                icon: const Icon(
                                  Icons.replay_10,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  if (_controller != null && _isInitialized) {
                                    final newPosition =
                                        _controller!.value.position -
                                        const Duration(seconds: 10);
                                    _controller!.seekTo(
                                      newPosition > Duration.zero
                                          ? newPosition
                                          : Duration.zero,
                                    );
                                  }
                                },
                              ),
                              SizedBox(width: 6.w),
                              IconButton(
                                constraints: const BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                icon: Icon(
                                  _isPlaying ? Icons.pause : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 36.sp,
                                ),
                                onPressed: _playPause,
                              ),
                              SizedBox(width: 6.w),
                              IconButton(
                                constraints: const BoxConstraints(
                                  minWidth: 0,
                                  minHeight: 0,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                icon: const Icon(
                                  Icons.forward_10,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  if (_controller != null && _isInitialized) {
                                    final newPosition =
                                        _controller!.value.position +
                                        const Duration(seconds: 10);
                                    _controller!.seekTo(
                                      newPosition < _controller!.value.duration
                                          ? newPosition
                                          : _controller!.value.duration,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white70,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.fullscreen,
                              color: Colors.white70,
                            ),
                            onPressed: () {},
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
    );
  }

  Widget _circleButton({required Widget child, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha((0.08 * 255).round()),
          shape: BoxShape.circle,
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final VideoPlayerController? controller;
  final bool isInitialized;

  const _ProgressBar({this.controller, required this.isInitialized});

  @override
  Widget build(BuildContext context) {
    if (!isInitialized || controller == null) {
      return SizedBox(height: 12.h);
    }

    final position = controller!.value.position;
    final duration = controller!.value.duration;
    final fillFactor = duration.inMilliseconds > 0
        ? position.inMilliseconds / duration.inMilliseconds
        : 0.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final fillWidth = totalWidth * fillFactor;

        return SizedBox(
          height: 12.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                width: fillWidth,
                top: 0,
                bottom: 0,
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              // thumb removed to match design (no white dot on progress bar)
            ],
          ),
        );
      },
    );
  }
}
