part of 'trim_video_cubit.dart';

sealed class TrimVideoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TrimVideoLoading extends TrimVideoState {}

class TrimVideoLoaded extends TrimVideoState {
  final Trimmer trimmer;

  TrimVideoLoaded(this.trimmer);

  @override
  List<Object?> get props => [trimmer];
}

class TrimVideoError extends TrimVideoState {
  final String message;

  TrimVideoError(this.message);

  @override
  List<Object?> get props => [message];
}
