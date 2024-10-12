import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../Core/Helpers/dependency_injection_helper.dart';
import '../../../../Domain/Entities/comment_entity.dart';
import '../../../../Domain/UseCases/getAllComment_usecases.dart';
part 'post_comment_event.dart';
part 'post_comment_state.dart';

class PostCommentBloc extends Bloc<PostCommentEvent, PostCommentState> {
  PostCommentBloc() : super(PostCommentInitial()) {
    on<GetPostCommentData>(_getCommentData);
  }

  late GetallcommentUsecases _getallcommentUsecases;
  DependencyInjectionHelper dependencyInjectionHelper =
      DependencyInjectionHelper();

  _getCommentData(
      GetPostCommentData event, Emitter<PostCommentState> emit) async {
    print('Post Data Event >>>>>> ${event.postID}');
    _getallcommentUsecases =
        dependencyInjectionHelper.sl<GetallcommentUsecases>();
    final res =
        await _getallcommentUsecases.call(pageNo: 1, postID: event.postID);
    res.fold((l) {
      emit(GetPostCommentState(isGetData: false));
    }, (comment) {
      emit(GetPostCommentState(isGetData: true));
      emit(HavePostCommentState(
        commentEntity: comment.data!.data!,
      ));
    });
  }
}

extension on Object? {
  get data => null;
}
