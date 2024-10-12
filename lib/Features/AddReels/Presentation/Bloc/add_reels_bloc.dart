import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hypelify_v2/Core/Functions/app_validator.dart';
import 'package:hypelify_v2/Core/Routes/routes.dart';
import 'package:hypelify_v2/Features/AddReels/Domain/Repositories/add_reel_repository.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../Core/Services/media_service.dart';

part 'add_reels_event.dart';

part 'add_reels_state.dart';

class AddReelsBloc extends Bloc<AddReelsEvent, AddReelsState> {
  final MediaService mediaService;
  final AddReelRepository addReelRepository;

  AddReelsBloc(this.mediaService, this.addReelRepository) : super(GalleryLoadingState()) {
    on<FetchMediaEvent>(_fetchMedia);
    on<AddSelectedItemsEvent>(_addSelectedItems);
    on<CaptionChangedEvent>((event, emit) {
      if (state is GalleryLoadedState) {
        emit((state as GalleryLoadedState).copyWith(caption: event.caption));
      }
    });
    on<AddReelEvent>(_addReel);
  }

  _fetchMedia(FetchMediaEvent event, Emitter<AddReelsState> emit) async {
    emit(GalleryLoadingState());
    try {
      final albums = await mediaService.fetchAlbums();
      final album = albums.isNotEmpty ? albums.first : null;
      if (album != null) {
        var media = await album.getAssetListRange(start: 0, end: 100);
        emit(
          GalleryLoadedState(
            albums: albums,
            media: media,
          ),
        );
      } else {
        emit(GalleryErrorState('No albums found.'));
      }
    } catch (e) {
      emit(GalleryErrorState(e.toString()));
    }
  }

  void _addSelectedItems(AddSelectedItemsEvent event, Emitter<AddReelsState> emit) {
    if (state is GalleryLoadedState) {
      final loadedState = state as GalleryLoadedState;

      final updatedSelectedItems = {...loadedState.selectedItems};
      if (updatedSelectedItems.containsKey(event.index)) {
        updatedSelectedItems.remove(event.index);
      } else {
        updatedSelectedItems.addAll({event.index: event.bytesAndAsset});
      }
      final newState = loadedState.copyWith(
        selectedItems: updatedSelectedItems,
      );
      emit(newState);
    }
  }

  FutureOr<void> _addReel(AddReelEvent event, Emitter<AddReelsState> emit) async {
    try {
      EasyLoading.show(status: 'Uploading...');
      if (event.videoFile != null) {
        final MultipartFile multipartFile =
            await MultipartFile.fromFile(event.videoFile!.path, filename: basename(event.videoFile!.path));
        Map<String, dynamic> body = {
          'caption': event.caption,
          'audience': event.audience,
          'type': AppValidator.isImage(event.videoFile!.path)
              ? 'image'
              : AppValidator.isVideo(event.videoFile!.path)
                  ? 'video'
                  : 'audio',
        };
        if (AppValidator.isVideo(event.videoFile!.path)) {
          body['video'] = multipartFile;
        } else if (AppValidator.isImage(event.videoFile!.path)) {
          body['image'] = multipartFile;
        } else {
          body['audio'] = multipartFile;
        }
        final res = await addReelRepository.addReel(
          FormData.fromMap(body),
        );
        res.fold(
          (l) {
            EasyLoading.showError(l.message);
          },
          (r) {
            EasyLoading.showSuccess(r);
            Navigator.pushNamedAndRemoveUntil(event.context, AppRoutes.bottomNavBar, (route) => false);
          },
        );
      }
      EasyLoading.dismiss();
    } catch (e) {
      //emit(GalleryErrorState(e.toString()));
    }
  }
}
