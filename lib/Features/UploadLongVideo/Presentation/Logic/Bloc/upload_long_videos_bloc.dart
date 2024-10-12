import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../../Core/Services/media_service.dart';

part 'upload_long_videos_event.dart';

part 'upload_long_videos_state.dart';

class UploadLongVideosBloc
    extends Bloc<UploadLongVideosEvent, UploadLongVideosState> {
  final MediaService mediaService;

  UploadLongVideosBloc(this.mediaService)
      : super(UploadLongVideoGalleryLoadingState()) {
    on<FetchMediaUploadLongVideosEvent>(_fetchMedia);
    /*on<SetSelectedVideoUploadLongVideosEvent>(_setSelectedVideo);*/
  }

  _fetchMedia(FetchMediaUploadLongVideosEvent event,
      Emitter<UploadLongVideosState> emit) async {
    emit(UploadLongVideoGalleryLoadingState());
    try {
      final albums = await mediaService.fetchAlbums(videosOnly: true);
      final album = albums.isNotEmpty ? albums.first : null;
      if (album != null) {
        var media = await album.getAssetListRange(start: 0, end: 100);
        emit(
          UploadLongVideoGalleryLoadedState(
            albums: albums,
            media: media,
          ),
        );
      } else {
        emit(UploadLongVideoGalleryErrorState('No albums found.'));
      }
    } catch (e) {
      emit(UploadLongVideoGalleryErrorState(e.toString()));
    }
  }

  /*Future<void> _setSelectedVideo(
      SetSelectedVideoUploadLongVideosEvent event, Emitter<UploadLongVideosState> emit) async {
    if (state is UploadLongVideoGalleryLoadedState) {
      final loadedState = state as UploadLongVideoGalleryLoadedState;

      UploadLongVideoGalleryLoadedState newState = loadedState.copyWith(
        selectedVideo: [],
      );
      emit(newState);

      await loadedState.trimmer.loadVideo(videoFile: event.selectedVideo).then((value) {});
    }
  }*/
}
