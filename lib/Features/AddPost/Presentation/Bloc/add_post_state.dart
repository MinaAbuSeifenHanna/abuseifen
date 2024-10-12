part of 'add_post_bloc.dart';

class AddPostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostGalleryLoadingState extends AddPostState {}

class PostGalleryLoadedState extends AddPostState {
  final bool isMultiSelector;
  final List<AssetPathEntity> albums;
  final List<AssetEntity> media;
  final Map<int, List> selectedItems;
  final String caption;
  final int audience;

  PostGalleryLoadedState({
    required this.isMultiSelector,
    required this.albums,
    required this.media,
    this.caption = '',
    this.audience = 1,
    Map<int, List>? selectedItems,
  }) : selectedItems = selectedItems ?? <int, List>{};

  PostGalleryLoadedState copyWith({
    List<AssetPathEntity>? albums,
    List<AssetEntity>? media,
    Map<int, List>? selectedItems,
    bool? isMultiSelector,
    String? caption,
    int? audience,
  }) {
    return PostGalleryLoadedState(
      albums: albums ?? this.albums,
      media: media ?? this.media,
      selectedItems: selectedItems ?? this.selectedItems,
      isMultiSelector: isMultiSelector ?? this.isMultiSelector,
      caption: caption ?? this.caption,
      audience: audience ?? this.audience,
    );
  }

  @override
  List<Object?> get props => [albums, media, selectedItems, isMultiSelector, caption, audience];
}

class PostGalleryErrorState extends AddPostState {
  final String message;

  PostGalleryErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
