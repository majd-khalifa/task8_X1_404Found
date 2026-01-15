// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:task8/data/movie_api.dart';

class TrailerPage extends StatefulWidget {
  final int movieId;
  final String? title;
  final String? subtitle;

  const TrailerPage({
    super.key,
    required this.movieId,
    this.title,
    this.subtitle,
  });

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  late YoutubePlayerController _youtubeController;
  bool isLoading = true;
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
              showLiveFullscreenButton: true,
            ),
          );

          if (mounted) {
            setState(() {
              trailerUrl = url;
              isLoading = false;
            });
            print('✅ YouTube player initialized');
          }
        } else {
          print('❌ Failed to extract video ID');
          if (mounted) {
            setState(() => isLoading = false);
          }
        }
      } else {
        print('❌ No trailer available for this movie');
        if (mounted) {
          setState(() => isLoading = false);
        }
      }
    } catch (e) {
      print('❌ Exception in _loadVideo: $e');
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                'جاري تحميل الفيديو...',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    if (trailerUrl == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_library_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'لا يوجد تريلر متاح',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'هذا الفيلم لا يملك فيديو تريلر في الوقت الحالي',
                    style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'العودة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[800],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title ?? 'Trailer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.subtitle ?? 'Official Trailer',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // YouTube Player
            Expanded(
              child: YoutubePlayer(
                controller: _youtubeController,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                onReady: () {
                  print('✅ YouTube player ready');
                },
                onEnded: (data) {
                  print('✅ Video ended');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
