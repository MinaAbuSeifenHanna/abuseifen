part of 'reels_camera_bloc.dart';

// ignore: must_be_immutable
class ReelsCameraState extends Equatable {
  bool isVideo;
  bool isRecording;
  bool startedRecording;

  ReelsCameraState({
    this.isVideo = false,
    this.isRecording = false,
    this.startedRecording = false,
  });

  ReelsCameraState copyWith({
    bool? isVideo,
    bool? isRecording,
    bool? startedRecording,
  }) =>
      ReelsCameraState(
        isVideo: isVideo ?? this.isVideo,
        isRecording: isRecording ?? this.isRecording,
        startedRecording: startedRecording ?? this.startedRecording,
      );

  @override
  List<Object?> get props => [isVideo, isRecording, startedRecording];
}

// ignore: must_be_immutable
class CaptureState extends ReelsCameraState {
  final File file;

  CaptureState({required this.file});

  @override
  List<Object?> get props => [file];
}
