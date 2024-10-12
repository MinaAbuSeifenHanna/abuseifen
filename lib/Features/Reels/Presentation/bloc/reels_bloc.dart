// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hypelify_v2/Core/Helpers/helpers.dart';
import 'package:hypelify_v2/Features/Reels/Domain/UseCases/get_reels_usecase.dart';
import '../../Domain/Entities/reel.dart';

part 'reels_event.dart';
part 'reels_state.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  ReelsBloc() : super(ReelsInitial()) {
    // on<ReelsEvent>((event, emit) {});
    on<GetReelsData>(_getReelsData);
  }

  late GetReelsUsecase _getReelsUsecase;
  DependencyInjectionHelper dependencyInjectionHelper =
      DependencyInjectionHelper();

  _getReelsData(ReelsEvent event, Emitter<ReelsState> emit) async {
    _getReelsUsecase = dependencyInjectionHelper.sl<GetReelsUsecase>();
    final res = await _getReelsUsecase.call(pageNo: 1);
    res.fold((l) {
      emit(ReelsGetDataState(isGetData: false));
    }, (data) {
      emit(ReelsGetDataState(isGetData: true));
      emit(ReelsHaveDataState(
        reelsDataModel: data.data!.data!,
      ));
    });
  }
}
