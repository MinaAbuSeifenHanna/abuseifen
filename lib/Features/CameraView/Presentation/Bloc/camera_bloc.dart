import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraState()) {
    on<SetCameraTypeEvent>((event, emit) => emit(state.copyWith(isVideo: event.isVideo)));
    on<StartRecordingEvent>((event, emit) => emit(state.copyWith(isRecording: true, startedRecording: true)));
    on<PauseRecordingEvent>((event, emit) => emit(state.copyWith(isRecording: false)));
    on<CaptureEvent>(_captureImageOrVideo);
  }

  Future<void> _captureImageOrVideo(CaptureEvent event, Emitter<CameraState> emit) async {
    emit(CaptureState(file: event.file));
  }
}
