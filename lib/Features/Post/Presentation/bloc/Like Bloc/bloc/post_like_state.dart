part of 'post_like_bloc.dart';

sealed class PostLikeState extends Equatable {
  const PostLikeState();

  @override
  List<Object> get props => [];
}

final class PostLikeInitial extends PostLikeState {}

// ignore: must_be_immutable
final class GetPostLikeState extends PostLikeState {
  bool isGetData;
  GetPostLikeState({required this.isGetData});
  GetPostLikeState copyWith({bool? haveData}) => GetPostLikeState(
        isGetData: haveData ?? this.isGetData,
      );
}

// ignore: must_be_immutable
final class HavePostLikeState extends PostLikeState {
  List<LikeDataEntity> likeEntity;
  HavePostLikeState({required this.likeEntity});
  HavePostLikeState copyWith({List<LikeDataEntity>? likeData}) =>
      HavePostLikeState(
        likeEntity: likeData ?? this.likeEntity,
      );
}

// ignore: must_be_immutable
final class NoPostLikeFoundState extends PostLikeState {
  bool isGetData;
  NoPostLikeFoundState({required this.isGetData});
  NoPostLikeFoundState copyWith({bool? haveData}) => NoPostLikeFoundState(
        isGetData: haveData ?? this.isGetData,
      );
}
