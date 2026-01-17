import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:task8/data/movie_api.dart';
import 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(const TrailerState());

  Future<void> loadTrailer(int movieId) async {
    try {
      final url = await MovieApi().getTrailerUrl(movieId);

      if (url == null || url.isEmpty) {
        emit(state.copyWith(isLoading: false, trailerUrl: null));
        return;
      }

      final videoId = MovieApi.extractYoutubeVideoId(url);

      if (videoId == null || videoId.isEmpty) {
        emit(state.copyWith(isLoading: false, trailerUrl: null));
        return;
      }

      final controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          hideControls: true,
          showLiveFullscreenButton: false,
        ),
      );

      controller.addListener(() {
        if (!isClosed) emit(state.copyWith());
      });

      emit(
        state.copyWith(
          isLoading: false,
          trailerUrl: url,
          videoId: videoId,
          controller: controller,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, trailerUrl: null));
    }
  }

  void togglePlayPause() {
    final c = state.controller;
    if (c == null) return;

    if (c.value.isPlaying) {
      c.pause();
      emit(state.copyWith(isPlaying: false, showControls: true));
    } else {
      c.play();
      emit(
        state.copyWith(
          isPlaying: true,
          hasPlayedOnce: true, // 🔥 أهم سطر
        ),
      );
      hideControlsAfterDelay();
    }
  }

  void toggleMute() {
    final c = state.controller;
    if (c == null) return;

    if (state.isMuted) {
      c.unMute();
      emit(state.copyWith(isMuted: false));
    } else {
      c.mute();
      emit(state.copyWith(isMuted: true));
    }

    hideControlsAfterDelay();
  }

  void seekForward() {
    final c = state.controller;
    if (c == null) return;

    final pos = c.value.position;
    final dur = c.value.metaData.duration;

    final newPos = pos + const Duration(seconds: 10);
    c.seekTo(newPos > dur ? dur : newPos);

    hideControlsAfterDelay();
  }

  void seekBackward() {
    final c = state.controller;
    if (c == null) return;

    final pos = c.value.position;
    final newPos = pos - const Duration(seconds: 10);

    c.seekTo(newPos.isNegative ? Duration.zero : newPos);

    hideControlsAfterDelay();
  }

  void toggleControls() {
    emit(state.copyWith(showControls: !state.showControls));
    if (state.showControls) hideControlsAfterDelay();
  }

  void hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      final c = state.controller;
      if (c != null && c.value.isPlaying && !isClosed) {
        emit(state.copyWith(showControls: false));
      }
    });
  }

  void toggleFullscreen() {
    final newValue = !state.isFullscreen;

    emit(state.copyWith(isFullscreen: newValue));

    if (newValue) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    hideControlsAfterDelay();
  }

  void onVideoEnded() {
    emit(state.copyWith(isPlaying: false, showControls: true));
  }

  @override
  Future<void> close() {
    state.controller?.dispose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return super.close();
  }
}
