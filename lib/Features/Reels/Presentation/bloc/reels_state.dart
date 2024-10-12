part of 'reels_bloc.dart';

sealed class ReelsState extends Equatable {
  const ReelsState();

  @override
  List<Object> get props => [];
}

final class ReelsInitial extends ReelsState {}

// ignore: must_be_immutable
final class ReelsGetDataState extends ReelsState {
  bool isGetData;
  ReelsGetDataState({required this.isGetData});
  ReelsGetDataState copyWith({bool? haveData}) => ReelsGetDataState(
        isGetData: haveData ?? this.isGetData,
      );
}

// ignore: must_be_immutable
class ReelsHaveDataState extends ReelsState {
  List<ReelsDataEntity> reelsDataModel;
  ReelsHaveDataState({required this.reelsDataModel});
  ReelsHaveDataState copyWith({List<ReelsDataEntity>? reelsData}) =>
      ReelsHaveDataState(
        reelsDataModel: reelsData ?? this.reelsDataModel,
      );
}

// ignore: must_be_immutable
final class NoReelsDataState extends ReelsState {
  bool isGetData;
  NoReelsDataState({required this.isGetData});
  NoReelsDataState copyWith({bool? haveData}) => NoReelsDataState(
        isGetData: haveData ?? this.isGetData,
      );
}
