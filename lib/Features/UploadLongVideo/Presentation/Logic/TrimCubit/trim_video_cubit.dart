import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_trimmer/video_trimmer.dart';

part 'trim_video_state.dart';

class TrimVideoCubit extends Cubit<TrimVideoState> {
  final Trimmer trimmer;

  TrimVideoCubit()
      : trimmer = Trimmer(),
        super(TrimVideoLoading());

  Future<void> loadVideo(File videoFile) async {
    try {
      await trimmer.loadVideo(videoFile: videoFile).then((v) async {
        await trimmer.videoPlayerController?.play();
        emit(TrimVideoLoaded(trimmer));
      });
    } catch (e) {
      emit(TrimVideoError(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    await trimmer.videoPlayerController?.pause();
    trimmer.dispose();
    return super.close();
  }
}
