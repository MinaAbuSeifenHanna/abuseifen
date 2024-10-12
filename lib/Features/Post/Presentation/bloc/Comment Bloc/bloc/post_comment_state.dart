part of 'post_comment_bloc.dart';

sealed class PostCommentState extends Equatable {
  const PostCommentState();

  @override
  List<Object> get props => [];
}

final class PostCommentInitial extends PostCommentState {}

// ignore: must_be_immutable
final class GetPostCommentState extends PostCommentState {
  bool isGetData;
  GetPostCommentState({required this.isGetData});
  GetPostCommentState copyWith({bool? haveData}) => GetPostCommentState(
        isGetData: haveData ?? this.isGetData,
      );
}

// ignore: must_be_immutable
final class HavePostCommentState extends PostCommentState {
  List<CommentDataEntity> commentEntity;
  HavePostCommentState({required this.commentEntity});
  HavePostCommentState copyWith({List<CommentDataEntity>? commentData}) =>
      HavePostCommentState(
        commentEntity: commentData ?? this.commentEntity,
      );
}

// ignore: must_be_immutable
final class NoPostCommentFoundState extends PostCommentState {
  bool isGetData;
  NoPostCommentFoundState({required this.isGetData});
  NoPostCommentFoundState copyWith({bool? haveData}) => NoPostCommentFoundState(
        isGetData: haveData ?? this.isGetData,
      );
}
