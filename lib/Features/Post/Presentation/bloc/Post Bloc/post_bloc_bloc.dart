import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../Core/Helpers/dependency_injection_helper.dart';
import '../../../Domain/Entities/post_entity.dart';
import '../../../Domain/UseCases/getAllPost_usecase.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PostBlocBloc() : super(PostBlocInitial()) {
    on<GetPostData>(_getPostData);
  }

  late GetallpostUsecase _getallpostUsecase;
  DependencyInjectionHelper dependencyInjectionHelper =
      DependencyInjectionHelper();

  _getPostData(PostBlocEvent event, Emitter<PostBlocState> emit) async {
    _getallpostUsecase = dependencyInjectionHelper.sl<GetallpostUsecase>();
    final res = await _getallpostUsecase.call(pageNo: 1);
    res.fold((l) {
      emit(GetPostsState(isGetData: false));
    }, (post) {
      emit(GetPostsState(isGetData: true));
      emit(HavePostsState(
        postDataEntity: post.data!.data!,
      ));
    });
  }
}
