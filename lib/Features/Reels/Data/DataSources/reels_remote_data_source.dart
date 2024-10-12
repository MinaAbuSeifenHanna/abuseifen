import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Constants/apis.dart';

class ReelsRemoteDataSource{
  final Dio _dio;

  ReelsRemoteDataSource(this._dio);

  Future<Response> getReels({required int pageNo}) =>
      _dio.get('reels/get-all?per_page=50&page=$pageNo');

  Future<Response> addComment({required int reelId, required String comment}) => _dio.post(
        Apis.addComment,
        data: {
          'reel_id': reelId,
          'comment': comment,
        },
      );

  Future<Response> getComment({required int reelId, required int perPage, int? page}) => _dio.get(
        Apis.addComment,
        queryParameters: {
          'reel_id': reelId,
          'per_page': perPage,
          'page': page ?? 1,
        },
      );

  Future<Response> addShares({required int reelId}) => _dio.post(
        Apis.addShares,
        data: {
          'reel_id': reelId,
        },
      );

  Future<Response> getShares({required int reelId, required int perPage}) => _dio.get(
        Apis.getShares,
        data: {
          'reel_id': reelId,
          'per_page': perPage,
        },
      );
}