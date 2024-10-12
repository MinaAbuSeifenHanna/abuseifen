import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Core/Handler/error_handler.dart';
import 'package:hypelify_v2/Core/Handler/response_code.dart';
import 'package:hypelify_v2/Core/Handler/response_message.dart';
import 'package:hypelify_v2/Features/AddReels/Data/DataSources/add_reel_data_source.dart';
import 'package:hypelify_v2/Features/AddReels/Domain/Repositories/add_reel_repository.dart';

class AddReelRepositoryImpl implements AddReelRepository {
  final AddReelDataSource addReelDataSource;

  const AddReelRepositoryImpl(this.addReelDataSource);

  @override
  Future<Either<Failure, String>> addReel(FormData data) async {
    try {
      final res = await addReelDataSource.addReel(data);
      if (res.statusCode == 200 && res.data['success'] == true) {
        return Right(res.data['message'] ?? 'Reel added successfully');
      }
      return Left(
        Failure(
            code: res.statusCode ?? APIResponseCode.unknown,
            message: res.data['message'] ?? APIResponseMessages.unknown,
        ),
      );
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
