import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Features/AddPost/Domain/Repositories/add_posts_repository.dart';
import 'package:path/path.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../Core/Services/media_service.dart';

part 'add_post_event.dart';

part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  final MediaService mediaService;
  final AddPostsRepository addPostsRepository;

  AddPostBloc(this.mediaService, this.addPostsRepository) : super(PostGalleryLoadingState()) {
    on<FetchMediaPostsEvent>(_fetchMedia);
    on<PostAddSelectedItemsEvent>(_addSelectedItems);
    on<ToggleIsMultiSelector>(_toggleIsMultiSelector);
    on<AddPostActionEvent>(_addPost);
  }

  _fetchMedia(FetchMediaPostsEvent event, Emitter<AddPostState> emit) async {
    emit(PostGalleryLoadingState());
    try {
      final albums = await mediaService.fetchAlbums();
      final album = albums.isNotEmpty ? albums.first : null;
      if (album != null) {
        var media = await album.getAssetListRange(start: 0, end: 100);
        Map<int, List>? selectedItems;
        if (media.isNotEmpty) {
          Uint8List? mediaData = await media.first.thumbnailDataWithOption(
            const ThumbnailOption(
              size: ThumbnailSize(
                640, // Set width for high quality
                640, // Set height for high quality
              ),
              quality: 100, // Set quality (0-100) for high quality
            ),
          );
          selectedItems = {
            0: [mediaData, media.first]
          };
        }
        emit(
          PostGalleryLoadedState(
            albums: albums,
            media: media,
            isMultiSelector: false,
            selectedItems: selectedItems,
          ),
        );
      } else {
        emit(PostGalleryErrorState('No albums found.'));
      }
    } catch (e) {
      emit(PostGalleryErrorState(e.toString()));
    }
  }

  _addSelectedItems(PostAddSelectedItemsEvent event, Emitter<AddPostState> emit) {
    if (state is PostGalleryLoadedState) {
      final loadedState = state as PostGalleryLoadedState;
      final updatedSelectedItems = {...loadedState.selectedItems};
      if (loadedState.isMultiSelector) {
        if (updatedSelectedItems.containsKey(event.index)) {
          if (updatedSelectedItems.length > 1) updatedSelectedItems.remove(event.index);
        } else {
          updatedSelectedItems.addAll({event.index: event.bytesAndAsset});
        }
        final newState = loadedState.copyWith(
          selectedItems: updatedSelectedItems,
        );
        emit(newState);
      } else {
        final newState = loadedState.copyWith(
          selectedItems: {event.index: event.bytesAndAsset},
        );
        emit(newState);
      }
    }
  }

  _toggleIsMultiSelector(ToggleIsMultiSelector event, Emitter<AddPostState> emit) {
    if (state is PostGalleryLoadedState) {
      final loadedState = state as PostGalleryLoadedState;
      bool isMultiSelector = !loadedState.isMultiSelector;
      PostGalleryLoadedState newState = loadedState;
      if (loadedState.selectedItems.isNotEmpty) {
        newState = loadedState.copyWith(isMultiSelector: isMultiSelector, selectedItems: {
          loadedState.selectedItems.entries.first.key: loadedState.selectedItems.entries.first.value
        });
      }
      emit(newState);
    }
  }

  FutureOr<void> _addPost(AddPostActionEvent event, Emitter<AddPostState> emit) async {
    try {
      EasyLoading.show(status: 'Uploading...');
      if (event.videoFile?.isNotEmpty ?? false) {
        List<MultipartFile> multipartFiles = [];

        for (var file in event.videoFile!) {
          String fileName = basename(file.path);

          MultipartFile multipartFile = await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          );

          multipartFiles.add(multipartFile);
        }
        Map<String, dynamic> body = {
          'caption': event.caption,
          'audience': event.audience,
          'files[]': multipartFiles,
        };
        final res = await addPostsRepository.addPosts(
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
    } catch (e) {
      EasyLoading.showError(e.toString());
      //emit(GalleryErrorState(e.toString()));
    } finally {
      EasyLoading.dismiss();
    }
  }
}
