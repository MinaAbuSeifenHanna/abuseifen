part of 'add_reels_bloc.dart';

@immutable
sealed class AddReelsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMediaEvent extends AddReelsEvent {}

class CaptionChangedEvent extends AddReelsEvent {
  final String caption;

  CaptionChangedEvent(this.caption);
}

class AddSelectedItemsEvent extends AddReelsEvent {
  final int index;
  final List bytesAndAsset;

  AddSelectedItemsEvent(this.index, this.bytesAndAsset);

  @override
  List<Object?> get props => [index, bytesAndAsset];
}

class AddReelEvent extends AddReelsEvent {
  final String caption;
  final String audience;
  final File? videoFile;
  final BuildContext context;

  AddReelEvent({
    required this.caption,
    required this.videoFile,
    required this.audience,
    required this.context,
  });
}
