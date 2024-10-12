import 'package:dio/dio.dart';

import '../../../../Core/Constants/apis.dart';

class AuthDataSource {
  final Dio _dio;

  AuthDataSource(this._dio);

  Future<Response> authUsingGoogle() => _dio.get(Apis.googleAuth);

  Future<Response> loginUsingEmail({required String email, required String password}) => _dio.post(
        Apis.login,
        data: {
          'email': email,
          'password': password,
        },
      );


  Future<Response> registerUsingEmail({required String email, required String password, required String passwordConfirmation}) =>
      _dio.post(
        Apis.register,
        data: {
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

 // Future<Response> logout() => _dio.get(Apis.logout);
}
