import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';

abstract class AddReelRepository {
  Future <Either<Failure, String>> addReel(FormData data);
}