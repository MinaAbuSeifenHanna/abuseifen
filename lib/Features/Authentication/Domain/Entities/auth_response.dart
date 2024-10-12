import 'package:hypelify_v2/Features/Authentication/Domain/Entities/register_data_response.dart';

class AuthResponse {
  final String token;
  final String message;
  final RegisterDataResponse? user;

  AuthResponse({
    required this.token,
    required this.message,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] ?? '',
      message: json['message'] ?? '',
      user: json['user'] != null ? RegisterDataResponse.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'message': message,
      'user': user?.toJson(),
    };
  }
}
