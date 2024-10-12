part of 'post_like_bloc.dart';

sealed class PostLikeEvent extends Equatable {
  const PostLikeEvent();

  @override
  List<Object> get props => [];
}

class GetPostLikeData extends PostLikeEvent {
  final int postID;

  const GetPostLikeData({required this.postID});

  @override
  List<Object> get props => [postID];
}
