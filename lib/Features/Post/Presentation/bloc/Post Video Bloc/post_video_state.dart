part of 'post_video_bloc.dart';

sealed class PostVideoState extends Equatable {
  const PostVideoState();

  @override
  List<Object> get props => [];
}

class VideoLoading extends PostVideoState {}

class VideoInitialized extends PostVideoState {
  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;
  final bool isPlaying;

  const VideoInitialized({
    required this.videoPlayerController,
    required this.chewieController,
    this.isPlaying = true,
  });

  @override
  List<Object> get props =>
      [videoPlayerController, chewieController, isPlaying];
}

class VideoError extends PostVideoState {
  final String message;

  const VideoError(this.message);

  @override
  List<Object> get props => [message];
}
