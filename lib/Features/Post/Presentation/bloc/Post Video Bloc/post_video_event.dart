part of 'post_video_bloc.dart';

sealed class PostVideoEvent extends Equatable {
  const PostVideoEvent();

  @override
  List<Object> get props => [];
}

class InitializeVideo extends PostVideoEvent {
  final String videoUrl;

  const InitializeVideo(this.videoUrl);

  @override
  List<Object> get props => [videoUrl];
}

class PlayPauseVideo extends PostVideoEvent {}

class DisposeVideo extends PostVideoEvent {}
