import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:task8/data/movie_api.dart';
import 'package:task8/core/constants/app_image.dart';
import 'widgets/trailer_header.dart';
import 'widgets/play_button.dart';
import 'widgets/trailer_controls.dart';

class TrailerPage extends StatefulWidget {
  final int movieId;
  final String title;
  final String subtitle;

  const TrailerPage({
    super.key,
    this.movieId = 155,
    this.title = 'Interstellar',
    this.subtitle = 'Official Trailer',
  });

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  VideoPlayerController? controller;
  bool initialized = false;
  bool playing = false;
  bool showControls = true;

  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  Future<void> _loadVideo() async {
    final url = await MovieApi().getTrailerUrl(widget.movieId);

    if (url != null) {
      controller = VideoPlayerController.networkUrl(Uri.parse(url))
        ..initialize().then((_) {
          setState(() => initialized = true);
        });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (playing) {
        setState(() => showControls = false);
      }
    });
  }

  void togglePlay() {
    if (!initialized) return;

    setState(() {
      if (controller!.value.isPlaying) {
        controller!.pause();
        playing = false;
        showControls = true;
      } else {
        controller!.play();
        playing = true;
        _startHideTimer();
      }
    });
  }

  void toggleControls() {
    setState(() => showControls = !showControls);
    if (showControls && playing) _startHideTimer();
  }

  bool get _isFirstFrame =>
      controller == null || controller!.value.position == Duration.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الصورة أو الفيديو
          Positioned.fill(
            child: GestureDetector(
              onTap: toggleControls,
              child: _buildVideoOrPoster(),
            ),
          ),

          // طبقة شفافة قبل التشغيل الأول فقط
          if (_isFirstFrame && !playing)
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.45)),
            ),

          // الهيدر
          if (showControls)
            TrailerHeader(
              title: widget.title,
              subtitle: widget.subtitle,
              onBack: () => Navigator.pop(context),
            ),

          // زر التشغيل قبل أول تشغيل فقط
          if (!playing) PlayButton(onPressed: togglePlay),

          // عناصر التحكم
          if (showControls && playing)
            TrailerControls(
              controller: controller,
              initialized: initialized,
              onPlayPause: togglePlay,
            ),
        ],
      ),
    );
  }

  Widget _buildVideoOrPoster() {
    // ✔ أول مرة → صورة
    // ✔ بعد التشغيل → فيديو دائمًا (حتى عند الإيقاف)
    bool showPoster =
        !initialized ||
        (controller!.value.position == Duration.zero && !playing);

    if (showPoster) {
      return Image.asset(AppImage.posterImage, fit: BoxFit.cover);
    }

    // فيديو (تشغيل + إيقاف = آخر فريم)
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: controller!.value.size.width,
          height: controller!.value.size.height,
          child: VideoPlayer(controller!),
        ),
      ),
    );
  }
}
