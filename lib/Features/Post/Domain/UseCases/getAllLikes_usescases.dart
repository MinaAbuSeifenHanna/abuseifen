import 'package:dartz/dartz.dart';

import '../../../../Core/Failures/failures.dart';
import '../Entities/like_entity.dart';
import '../Repository/post_repository.dart';

class GetalllikesUsescases {
  PostRepository postRepository;
  GetalllikesUsescases({
    required this.postRepository,
  });

  Future<Either<Failure, LikeEntity>> call({
    required int pageNo,
    required int postID,
  }) async {
    return await postRepository.getAllLikes(
      pageNo: pageNo,
      postID: postID,
    );
  }
}
