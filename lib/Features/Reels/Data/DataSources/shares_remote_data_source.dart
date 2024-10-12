import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Constants/apis.dart';

class SharesRemoteDataSource {
  final Dio _dio;

  SharesRemoteDataSource(this._dio);

  Future<Response> addShares({required int reelId}) => _dio.post(
        Apis.addShares,
        data: {
          'reel_id': reelId,
        },
      );

  Future<Response> getShares({required int reelId, required int perPage}) => _dio.get(
        Apis.getShares,
        queryParameters: {
          'reel_id': reelId,
          'per_page': perPage,
        },
      );
}
