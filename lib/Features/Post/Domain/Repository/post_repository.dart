import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';

import '../Entities/comment_entity.dart';
import '../Entities/like_entity.dart';
import '../Entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, PostEntity>> getAllPost({
    required int pageNo,
  });

  Future<Either<Failure, CommentEntity>> getAllComment({
    required int pageNo,
    required int postID,
  });

  Future<Either<Failure, LikeEntity>> getAllLikes({
    required int pageNo,
    required int postID,
  });
}
