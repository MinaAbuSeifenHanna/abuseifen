part of 'camera_bloc.dart';

class CameraState extends Equatable {
  bool isVideo;
  bool isRecording;
  bool startedRecording;

  CameraState({
    this.isVideo = false,
    this.isRecording = false,
    this.startedRecording = false,
  });

  CameraState copyWith({
    bool? isVideo,
    bool? isRecording,
    bool? startedRecording,
  }) =>
      CameraState(
        isVideo: isVideo ?? this.isVideo,
        isRecording: isRecording ?? this.isRecording,
        startedRecording: startedRecording ?? this.startedRecording,
      );

  @override
  List<Object?> get props => [isVideo, isRecording, startedRecording];
}

class CaptureState extends CameraState {
  final File file;

  CaptureState({required this.file});

  @override
  List<Object?> get props => [file];
}
