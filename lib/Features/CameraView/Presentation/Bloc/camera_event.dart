part of 'camera_bloc.dart';

class CameraEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetCameraTypeEvent extends CameraEvent {
  final bool isVideo;

  SetCameraTypeEvent({required this.isVideo});

  @override
  List<Object?> get props => [isVideo];
}

class CaptureEvent extends CameraEvent {
  final File file;

  CaptureEvent({required this.file});

  @override
  List<Object?> get props => [];
}

class StartRecordingEvent extends CameraEvent {}

class PauseRecordingEvent extends CameraEvent {}