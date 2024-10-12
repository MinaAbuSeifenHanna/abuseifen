import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'post_video_event.dart';
part 'post_video_state.dart';
// PostVideoBloc

class PostVideoBloc extends Bloc<PostVideoEvent, PostVideoState> {
  PostVideoBloc() : super(VideoLoading());

  Stream<PostVideoState> mapEventToState(PostVideoEvent event) async* {
    if (event is InitializeVideo) {
      yield* _mapInitializeVideoToState(event.videoUrl);
    } else if (event is PlayPauseVideo) {
      yield* _mapPlayPauseVideoToState();
    } else if (event is DisposeVideo) {
      yield* _mapDisposeVideoToState();
    }
  }

  Stream<PostVideoState> _mapInitializeVideoToState(String videoUrl) async* {
    try {
      final videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await videoPlayerController.initialize();

      final chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        showControls: false,
      );

      yield VideoInitialized(
        videoPlayerController: videoPlayerController,
        chewieController: chewieController,
      );
    } catch (e) {
      yield VideoError('Error initializing video: $e');
    }
  }

  Stream<PostVideoState> _mapPlayPauseVideoToState() async* {
    if (state is VideoInitialized) {
      final currentState = state as VideoInitialized;
      final isPlaying = currentState.chewieController.isPlaying;

      if (isPlaying) {
        currentState.chewieController.pause();
      } else {
        currentState.chewieController.play();
      }

      yield VideoInitialized(
        videoPlayerController: currentState.videoPlayerController,
        chewieController: currentState.chewieController,
        isPlaying: !isPlaying,
      );
    }
  }

  Stream<PostVideoState> _mapDisposeVideoToState() async* {
    if (state is VideoInitialized) {
      final currentState = state as VideoInitialized;
      currentState.chewieController.dispose();
      currentState.videoPlayerController.dispose();
    }
    yield VideoLoading();
  }
}
