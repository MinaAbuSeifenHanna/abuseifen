part of 'reels_camera_bloc.dart';

class ReelsCameraEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetCameraTypeEvent extends ReelsCameraEvent {
  final bool isVideo;

  SetCameraTypeEvent({required this.isVideo});

  @override
  List<Object?> get props => [isVideo];
}

class CaptureEvent extends ReelsCameraEvent {
  final File file;

  CaptureEvent({required this.file});

  @override
  List<Object?> get props => [];
}

class StartRecordingEvent extends ReelsCameraEvent {}

class PauseRecordingEvent extends ReelsCameraEvent {}

class EndRecordingEvent extends ReelsCameraEvent {}
