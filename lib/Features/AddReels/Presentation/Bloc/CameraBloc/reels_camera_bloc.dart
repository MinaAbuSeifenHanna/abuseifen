import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reels_camera_event.dart';

part 'reels_camera_state.dart';

class ReelsCameraBloc extends Bloc<ReelsCameraEvent, ReelsCameraState> {
  ReelsCameraBloc() : super(ReelsCameraState()) {
    on<SetCameraTypeEvent>((event, emit) => emit(state.copyWith(isVideo: event.isVideo)));
    on<StartRecordingEvent>((event, emit) => emit(state.copyWith(isRecording: true,startedRecording: true)));
    on<PauseRecordingEvent>((event, emit) => emit(state.copyWith(isRecording: false)));
    on<CaptureEvent>(_captureImageOrVideo);
  }

  Future<void> _captureImageOrVideo(CaptureEvent event, Emitter<ReelsCameraState> emit) async {
    emit(CaptureState(file: event.file));
  }
}
