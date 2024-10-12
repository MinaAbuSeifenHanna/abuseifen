import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Core/Handler/api_error_handler.dart';
import 'package:hypelify_v2/Core/Handler/error_handler.dart';
import 'package:hypelify_v2/Core/Handler/response_code.dart';
import 'package:hypelify_v2/Core/Handler/response_message.dart';
import 'package:hypelify_v2/Features/AddPost/Data/DataSources/add_posts_data_source.dart';
import 'package:hypelify_v2/Features/AddPost/Domain/Repositories/add_posts_repository.dart';

class AddPostsRepositoryImpl implements AddPostsRepository {
  final AddPostsDataSource source;

  AddPostsRepositoryImpl({required this.source});

  @override
  Future<Either<Failure, String>> addPosts(FormData data) async {
    try {
      final remoteData = await source.addPosts(data);
      if (remoteData.statusCode == 200 && remoteData.data['success']) {
        return Right(remoteData.data['message']);
      } else {
        return Left(
          Failure(
            code: remoteData.statusCode ?? APIResponseCode.unknown,
            message: APIResponseMessages.unknown,
          ),
        );
      }
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
