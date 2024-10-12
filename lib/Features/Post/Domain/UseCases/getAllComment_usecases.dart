import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Features/Post/Domain/Repository/post_repository.dart';

import '../Entities/comment_entity.dart';

class GetallcommentUsecases {
  PostRepository postRepository;
  GetallcommentUsecases({required this.postRepository});

  Future<Either<Failure, CommentEntity>> call({
    required int pageNo,
    required int postID,
  }) async {
    print('Post Data Event >>>>>>> $postID');
    return await postRepository.getAllComment(pageNo: pageNo, postID: postID);
  }
}
