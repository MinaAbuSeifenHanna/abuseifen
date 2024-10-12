import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/base_response.dart';
import 'package:hypelify_v2/Features/Reels/Domain/Entities/shares/shares.dart';

abstract class SharesRepository {
  Future<Either<Failure, BaseResponse<NewSharesResponse>>> addShares({required int reelId});

  Future<Either<Failure, BaseResponse<NewSharesResponse>>> getShares(
      {required int reelId, required int perPage});
}
