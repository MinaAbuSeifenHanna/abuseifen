import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/auth_response.dart';

import '../../../../Core/Failures/failures.dart';
import '../../../../Core/Handler/api_error_handler.dart';
import '../../../../Core/Handler/response_code.dart';
import '../../../../Core/Handler/response_message.dart';
import '../../Domain/Entities/base_response.dart';
import '../../Domain/Entities/register_data_response.dart';
import '../../Domain/Repositories/auth_repository.dart';
import '../DataSources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<Either<Failure, String>> authUsingGoogle() async {
    try {
      final response = await _authDataSource.authUsingGoogle();
      print("googleAuthUrl response.data = ${response.data}");
      if (response.statusCode == 200) {
        return Right(response.data['url'] as String);
      } else {
        return Left(
          Failure(
            code: response.statusCode ?? APIResponseCode.unknown,
            message: response.data['message'] ?? APIResponseMessages.unknown,
          ),
        );
      }
    } on DioException catch (e) {
      print("googleAuthUrl DioException = ${e.toString()}");
      return Left(APIErrorHandler.handleAPIError(e));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> loginUsingEmail(String email, String password) async {
    try {
      final response = await _authDataSource.loginUsingEmail(email: email, password: password);
      if (response.statusCode == 200) {
        return Right(AuthResponse.fromJson(response.data));
      } else {
        return Left(
          Failure(
            code: response.statusCode ?? APIResponseCode.unknown,
            message: response.data['message'] ?? APIResponseMessages.unknown,
          ),
        );
      }
    } on Exception catch (e) {
      return Left(Failure(code: APIResponseCode.unknown, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BaseResponse<RegisterDataResponse>>> registerUsingEmail(
      String email, String password, String passwordConfirmation) async {
    try {
      final response = await _authDataSource.registerUsingEmail(
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
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
