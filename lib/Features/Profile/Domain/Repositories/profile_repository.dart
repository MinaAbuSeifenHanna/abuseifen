import 'package:dartz/dartz.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/base_response.dart';

import '../../../../Core/Failures/failures.dart';
import '../../../Authentication/Domain/Entities/register_data_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure, BaseResponse<RegisterDataResponse>>> getProfile();

  Future<Either<Failure, BaseResponse<RegisterDataResponse>>> updateProfile(Map<String, dynamic> data);
}
