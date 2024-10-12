part of 'upload_long_videos_bloc.dart';

sealed class UploadLongVideosEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMediaUploadLongVideosEvent extends UploadLongVideosEvent {}

/*
class SetSelectedVideoUploadLongVideosEvent extends UploadLongVideosEvent {
  final int duration;
  final File selectedVideo;

  SetSelectedVideoUploadLongVideosEvent(this.duration, this.selectedVideo);

  @override
  List<Object?> get props => [duration, selectedVideo];
}
*/
