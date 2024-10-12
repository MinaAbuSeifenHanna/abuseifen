import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Features/Reels/Domain/Entities/reel.dart';

import 'package:hypelify_v2/Features/Authentication/Domain/Entities/base_response.dart';

import '../Entities/comments/comment.dart';

abstract class ReelsRepository {
  Future<Either<Failure, ReelsEntity>> getReels({required int pageNo});
  Future<Either<Failure, BaseResponse<NewCommentsResponse>>> addComment(
      {required int reelId, required String comment});

  Future<Either<Failure, BaseResponse<NewCommentsResponse>>> getComment(
      {required int reelId, required int perPage, int? page});
}