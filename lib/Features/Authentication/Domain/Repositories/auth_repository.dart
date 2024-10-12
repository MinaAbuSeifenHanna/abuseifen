import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/auth_response.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/base_response.dart';

import '../Entities/register_data_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> authUsingGoogle();

  Future<Either<Failure, AuthResponse>> loginUsingEmail(String email, String password);

  Future<Either<Failure, BaseResponse<RegisterDataResponse>>> registerUsingEmail(
      String email, String password, String passwordConfirmation);
}
