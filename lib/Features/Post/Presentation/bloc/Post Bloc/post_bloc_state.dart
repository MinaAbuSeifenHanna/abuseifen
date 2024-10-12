part of 'post_bloc_bloc.dart';

sealed class PostBlocState extends Equatable {
  const PostBlocState();

  @override
  List<Object> get props => [];
}

final class PostBlocInitial extends PostBlocState {}

// ignore: must_be_immutable
final class GetPostsState extends PostBlocState {
  bool isGetData;
  GetPostsState({required this.isGetData});
  GetPostsState copyWith({bool? haveData}) => GetPostsState(
        isGetData: haveData ?? this.isGetData,
      );
}

// ignore: must_be_immutable
final class HavePostsState extends PostBlocState {
  List<PostDataEntity> postDataEntity;
  HavePostsState({required this.postDataEntity});
  HavePostsState copyWith({List<PostDataEntity>? reelsData}) => HavePostsState(
        postDataEntity: reelsData ?? this.postDataEntity,
      );
}

// ignore: must_be_immutable
final class NoPostsFoundState extends PostBlocState {
  bool isGetData;
  NoPostsFoundState({required this.isGetData});
  NoPostsFoundState copyWith({bool? haveData}) => NoPostsFoundState(
        isGetData: haveData ?? this.isGetData,
      );
}
