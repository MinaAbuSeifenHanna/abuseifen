import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';

abstract class AddPostsRepository {
  Future <Either<Failure, String>> addPosts(FormData data);
}