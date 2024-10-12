import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:hypelify_v2/Core/Failures/failures.dart';

import 'package:hypelify_v2/Features/Authentication/Domain/Entities/base_response.dart';

import 'package:hypelify_v2/Features/Authentication/Domain/Entities/register_data_response.dart';

import '../../../../Core/Handler/api_error_handler.dart';
import '../../../../Core/Handler/response_code.dart';
import '../../../../Core/Handler/response_message.dart';
import '../../Domain/Repositories/profile_repository.dart';
import '../DataSources/profile_remote_data_source.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, BaseResponse<RegisterDataResponse>>> getProfile() async {
    try {
      final response = await _remoteDataSource.getProfile();
      if (response.statusCode == 200 && response.data['success'] == true) {
        return Right(
          BaseResponse<RegisterDataResponse>.fromJson(
            response.data,
            (data) {
              return RegisterDataResponse.fromJson(data);
            },
          ),
        );
      } else {
        return Left(
          Failure(
            code: response.statusCode ?? APIResponseCode.unknown,
            message: response.data['message'] ?? APIResponseMessages.unknown,
          ),
        );
      }
    } on DioException catch (e) {
      return Left(APIErrorHandler.handleAPIError(e));
    }
  }

  @override
  Future<Either<Failure, BaseResponse<RegisterDataResponse>>> updateProfile(Map<String, dynamic> data) async {
    try {
      final response = await _remoteDataSource.updateProfile(data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return Right(
          BaseResponse<RegisterDataResponse>.fromJson(
            response.data,
            (data) {
              return RegisterDataResponse.fromJson(data);
            },
          ),
        );
      } else {
        return Left(
          Failure(
            code: response.statusCode ?? APIResponseCode.unknown,
            message: response.data['message'] ?? APIResponseMessages.unknown,
          ),
        );
      }
    } on DioException catch (e) {
      return Left(APIErrorHandler.handleAPIError(e));
    }
  }
}
