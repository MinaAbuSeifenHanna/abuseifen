part of 'add_reels_bloc.dart';

class AddReelsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GalleryLoadingState extends AddReelsState {}

class GalleryLoadedState extends AddReelsState {
  final List<AssetPathEntity> albums;
  final List<AssetEntity> media;
  final Map<int, List> selectedItems;
  final String caption;
  final String audience;

  GalleryLoadedState({
    required this.albums,
    required this.media,
    this.caption = '',
    this.audience = 'public',
    Map<int, List>? selectedItems,
  }) : selectedItems = selectedItems ?? <int, List>{};

  GalleryLoadedState copyWith({
    List<AssetPathEntity>? albums,
    List<AssetEntity>? media,
    Map<int, List>? selectedItems,
    String? caption,
    String? audience,
    bool? isVideo,
  }) {
    return GalleryLoadedState(
      albums: albums ?? this.albums,
      media: media ?? this.media,
      selectedItems: selectedItems ?? this.selectedItems,
      caption: caption ?? this.caption,
      audience: audience ?? this.audience,
    );
  }

  @override
  List<Object?> get props => [albums, media, selectedItems, caption, audience];
}

class GalleryErrorState extends AddReelsState {
  final String message;

  GalleryErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
