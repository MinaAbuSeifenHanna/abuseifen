import 'package:dio/dio.dart';

import '../../../../Core/Constants/apis.dart';

class ProfileRemoteDataSource {
  final Dio _dio;

  ProfileRemoteDataSource(this._dio);

  Future<Response> getProfile() async => await _dio.get(Apis.profile);


  Future<Response> updateProfile(Map<String, dynamic> data) async => await _dio.post(Apis.updateProfile, data: data);
}
