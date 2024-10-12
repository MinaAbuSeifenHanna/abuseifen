import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/base_response.dart';
import '../../../../Core/Handler/error_handler.dart';
import '../../Domain/Entities/comments/comment.dart';
import '../../Domain/Repositories/reels_repository.dart';
import '../DataSources/reels_remote_data_source.dart';
import '../Models/reels_model.dart';

class ReelsRepositoryImpl implements ReelsRepository {
  final ReelsRemoteDataSource remoteDataSource;

  ReelsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, BaseResponse<NewCommentsResponse>>> addComment(
      {required int reelId, required String comment}) async {
    try {
      Response result =
          await remoteDataSource.addComment(reelId: reelId, comment: comment);
      if (result.data['success'] == true) {
        return right(
          BaseResponse.fromJson(
            result.data,
            (json) => NewCommentsResponse.fromJson(json),
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
  Future<Either<Failure, BaseResponse<NewCommentsResponse>>> getComment(
      {required int reelId, required int perPage, int? page}) async {
    try {
      Response result = await remoteDataSource.getComment(
          reelId: reelId, perPage: perPage, page: page);
      if (result.data['success'] == true) {
        return right(
          BaseResponse.fromJson(
            result.data,
            (json) => NewCommentsResponse.fromJson(json),
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
  Future<Either<Failure, ReelsModels>> getReels({required int pageNo}) async {
    try {
      final response = await remoteDataSource.getReels(pageNo: pageNo);
      print('Reels Data RR >>>>>>>>>>> ${response.data}');
      if (response.statusCode == 200) {
        final reelsData = response.data;
        return Right(ReelsModels.fromJson(reelsData));
      } else {
        return Left(Failure(
          code: response.statusCode!,
          message: response.statusMessage!,
        ));
      }
    } on DioException catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
