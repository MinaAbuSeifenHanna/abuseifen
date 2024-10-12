part of 'upload_long_videos_bloc.dart';

sealed class UploadLongVideosState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadLongVideoGalleryLoadingState extends UploadLongVideosState {}

class UploadLongVideoGalleryLoadedState extends UploadLongVideosState {
  final List<AssetPathEntity> albums;
  final List<AssetEntity> media;

  UploadLongVideoGalleryLoadedState({
    required this.albums,
    required this.media,
  });

  UploadLongVideoGalleryLoadedState copyWith({
    List<AssetPathEntity>? albums,
    List<AssetEntity>? media,
  }) {
    return UploadLongVideoGalleryLoadedState(
      albums: albums ?? this.albums,
      media: media ?? this.media,
    );
  }

  @override
  List<Object?> get props => [albums, media];
}

class UploadLongVideoGalleryErrorState extends UploadLongVideosState {
  final String message;

  UploadLongVideoGalleryErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
