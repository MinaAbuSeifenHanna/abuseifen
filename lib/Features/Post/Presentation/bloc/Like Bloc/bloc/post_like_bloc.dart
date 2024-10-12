import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../Core/Helpers/dependency_injection_helper.dart';
import '../../../../Domain/Entities/like_entity.dart';
import '../../../../Domain/UseCases/getAllLikes_usescases.dart';

part 'post_like_event.dart';
part 'post_like_state.dart';

class PostLikeBloc extends Bloc<PostLikeEvent, PostLikeState> {
  PostLikeBloc() : super(PostLikeInitial()) {
    on<GetPostLikeData>(_getLikeData);
  }
  late GetalllikesUsescases _getalllikesUsescases;
  DependencyInjectionHelper dependencyInjectionHelper =
      DependencyInjectionHelper();

  _getLikeData(GetPostLikeData event, Emitter<PostLikeState> emit) async {
    print('Post Data Event >>>>>> ${event.postID}');
    _getalllikesUsescases =
        dependencyInjectionHelper.sl<GetalllikesUsescases>();
    final res =
        await _getalllikesUsescases.call(pageNo: 1, postID: event.postID);
    res.fold((l) {
      emit(GetPostLikeState(isGetData: false));
    }, (comment) {
      emit(GetPostLikeState(isGetData: true));
      emit(HavePostLikeState(
        likeEntity: comment.data!.data!,
      ));
    });
  }
}
