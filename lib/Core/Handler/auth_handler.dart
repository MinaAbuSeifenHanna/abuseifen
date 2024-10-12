library auth_handler;

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/register_data_response.dart';

abstract class AuthHandlerInterface {
  String? getToken();

  RegisterDataResponse? getUserData();

  Future<AuthHandlerInterface> init();

  Future<void> setToken(String token);

  Future<void> setUserData(RegisterDataResponse? data);
}

class AuthHandler implements AuthHandlerInterface {
  AuthHandler({required this.secureStorage});

  final FlutterSecureStorage secureStorage;
  String? _token;
  RegisterDataResponse? _userData;

  @override
  String? getToken() => _token;

  @override
  RegisterDataResponse? getUserData() => _userData;

  @override
  Future<AuthHandlerInterface> init() async {
    _token = await secureStorage.read(key: 'token');
    final userDataString = await secureStorage.read(key: 'userData');
    _userData = userDataString != null
        ? RegisterDataResponse.fromJson(Map<String, dynamic>.from(json.decode(userDataString)))
        : null;
    return this;
  }

  @override
  Future<void> setUserData(RegisterDataResponse? data) async {
    _userData = data;
    if (data == null) {
      await secureStorage.delete(key: 'userData');
      return;
    }
    await secureStorage.write(key: 'userData', value: json.encode(data.toJson()));
  }

  @override
  Future<void> setToken(String token) async {
    _token = token;
    await secureStorage.write(key: 'token', value: token);
  }
}
