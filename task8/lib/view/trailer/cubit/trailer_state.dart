import 'package:equatable/equatable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerState extends Equatable {
  final bool isLoading;
  final bool isPlaying;
  final bool isMuted;
  final bool showControls;
  final bool isFullscreen;
  final bool isHoveringProgressBar;

  final bool hasPlayedOnce;

  final String? trailerUrl;
  final String? videoId;

  final YoutubePlayerController? controller;

  const TrailerState({
    this.isLoading = true,
    this.isPlaying = false,
    this.isMuted = false,
    this.showControls = true,
    this.isFullscreen = false,
    this.isHoveringProgressBar = false,
    this.hasPlayedOnce = false,
    this.trailerUrl,
    this.videoId,
    this.controller,
  });

  TrailerState copyWith({
    bool? isLoading,
    bool? isPlaying,
    bool? isMuted,
    bool? showControls,
    bool? isFullscreen,
    bool? isHoveringProgressBar,
    bool? hasPlayedOnce,
    String? trailerUrl,
    String? videoId,
    YoutubePlayerController? controller,
  }) {
    return TrailerState(
      isLoading: isLoading ?? this.isLoading,
      isPlaying: isPlaying ?? this.isPlaying,
      isMuted: isMuted ?? this.isMuted,
      showControls: showControls ?? this.showControls,
      isFullscreen: isFullscreen ?? this.isFullscreen,
      isHoveringProgressBar:
          isHoveringProgressBar ?? this.isHoveringProgressBar,
      hasPlayedOnce: hasPlayedOnce ?? this.hasPlayedOnce,
      trailerUrl: trailerUrl ?? this.trailerUrl,
      videoId: videoId ?? this.videoId,
      controller: controller ?? this.controller,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isPlaying,
    isMuted,
    showControls,
    isFullscreen,
    isHoveringProgressBar,
    hasPlayedOnce,
    trailerUrl,
    videoId,
    controller,
  ];
}
