part of 'post_comment_bloc.dart';

sealed class PostCommentEvent extends Equatable {
  const PostCommentEvent();

  @override
  List<Object> get props => [];
}

class GetPostCommentData extends PostCommentEvent {
  final int postID;

  const GetPostCommentData({required this.postID});

  @override
  List<Object> get props => [postID];
}
