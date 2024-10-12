import 'package:dartz/dartz.dart';

import '../../../../Core/Failures/failures.dart';
import '../Entities/post_entity.dart';
import '../Repository/post_repository.dart';

class GetallpostUsecase {
  PostRepository postRepository;
  GetallpostUsecase({
    required this.postRepository,
  });

  Future<Either<Failure, PostEntity>> call({required int pageNo}) async {
    return await postRepository.getAllPost(pageNo: pageNo);
  }
}
