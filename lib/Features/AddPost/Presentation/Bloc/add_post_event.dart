part of 'add_post_bloc.dart';

sealed class AddPostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMediaPostsEvent extends AddPostEvent {}

class ToggleIsMultiSelector extends AddPostEvent {}

class PostAddSelectedItemsEvent extends AddPostEvent {
  final int index;
  final List bytesAndAsset;

  PostAddSelectedItemsEvent(this.index, this.bytesAndAsset);

  @override
  List<Object?> get props => [index, bytesAndAsset];
}

class AddPostActionEvent extends AddPostEvent {
  final String caption;
  final int audience;
  final List<File>? videoFile;
  final BuildContext context;

  AddPostActionEvent({
    required this.caption,
    required this.videoFile,
    required this.audience,
    required this.context,
  });
}
