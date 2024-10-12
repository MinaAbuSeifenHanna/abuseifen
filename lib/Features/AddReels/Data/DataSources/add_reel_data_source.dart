import 'package:dio/dio.dart';
import 'package:hypelify_v2/Core/Constants/constants.dart';

class AddReelDataSource {
  final Dio dio;

  const AddReelDataSource(this.dio);

  Future<Response> addReel(FormData data) async {
    return await dio.post(Apis.postReel, data: data);
  }
}
