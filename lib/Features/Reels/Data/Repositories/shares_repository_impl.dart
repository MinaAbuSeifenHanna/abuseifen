import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Core/Handler/error_handler.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/base_response.dart';
import 'package:hypelify_v2/Features/Reels/Data/DataSources/shares_remote_data_source.dart';
import 'package:hypelify_v2/Features/Reels/Domain/Entities/shares/shares.dart';
import 'package:hypelify_v2/Features/Reels/Domain/Repositories/shares_repository.dart';

class SharesRepositoryImpl implements SharesRepository {
  final SharesRemoteDataSource remoteDataSource;

  SharesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, BaseResponse<NewSharesResponse>>> addShares({required int reelId}) async {
    try {
      Response result = await remoteDataSource.addShares(reelId: reelId);
      if (result.data['success'] == true) {
        return right(
          BaseResponse.fromJson(
            result.data,
            (json) => NewSharesResponse.fromJson(json),
          ),
        );
      } else {
        return left(ErrorHandler.handle(result.statusCode).failure);
      }
    } catch (error) {
      final errorHandler = ErrorHandler.handle(error);
      return left(errorHandler.failure);
    }
  }

  @override
  Future<Either<Failure, BaseResponse<NewSharesResponse>>> getShares(
      {required int reelId, required int perPage}) async {
    try {
      Response result = await remoteDataSource.getShares(reelId: reelId, perPage: perPage);
      if (result.data['success'] == true) {
        return right(
          BaseResponse.fromJson(
            result.data,
            (json) => NewSharesResponse.fromJson(json),
          ),
        );
      } else {
        return left(ErrorHandler.handle(result.statusCode).failure);
      }
    } catch (error) {
      final errorHandler = ErrorHandler.handle(error);
      return left(errorHandler.failure);
    }
  }
}
