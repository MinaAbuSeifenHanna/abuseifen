part of 'auth_bloc.dart';

abstract class AuthState {
  bool passHidden;
  bool isVisible;
  bool isPasswordEightCharacters;
  bool hasPasswordOneNumber;
  String? email;
  String? password;

  AuthState({
    required this.isVisible,
    required this.isPasswordEightCharacters,
    required this.hasPasswordOneNumber,
    required this.passHidden,
    this.email,
    this.password,
  });

  AuthInitial copyWith({
    bool? passHidden,
    bool? isVisible,
    bool? isPasswordEightCharacters,
    bool? hasPasswordOneNumber,
    String? email = '',
    String? password = '',
  }) =>
      AuthInitial(
        passHidden: passHidden ?? this.passHidden,
        isVisible: isVisible ?? this.isVisible,
        isPasswordEightCharacters: isPasswordEightCharacters ?? this.isPasswordEightCharacters,
        hasPasswordOneNumber: hasPasswordOneNumber ?? this.hasPasswordOneNumber,
        email: email == '' ? this.email : email,
        password: password == '' ? this.password : password,
      );
}

class AuthInitial extends AuthState {
  AuthInitial({
    required super.passHidden,
    required super.isVisible,
    required super.isPasswordEightCharacters,
    required super.hasPasswordOneNumber,
    super.email,
    super.password,
  });
}

class AuthLoading extends AuthState {
  AuthLoading({
    required super.isVisible,
    required super.isPasswordEightCharacters,
    required super.hasPasswordOneNumber,
    required super.passHidden,
  });
}

class AuthUrlLoaded extends AuthState {
  final String googleAuthUrl;

  AuthUrlLoaded({
    required this.googleAuthUrl,
    required super.isVisible,
    required super.isPasswordEightCharacters,
    required super.hasPasswordOneNumber,
    required super.passHidden,
  });
}

class AuthSuccess extends AuthState {
  final String token;

  AuthSuccess({
    required this.token,
    required super.isVisible,
    required super.isPasswordEightCharacters,
    required super.hasPasswordOneNumber,
    required super.passHidden,
  });
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({
    required this.message,
    required super.isVisible,
    required super.isPasswordEightCharacters,
    required super.hasPasswordOneNumber,
    required super.passHidden,
  });
}

class LoginUsingEmailSuccessState extends AuthState {
  LoginUsingEmailSuccessState({
    required super.isVisible,
    required super.isPasswordEightCharacters,
    required super.hasPasswordOneNumber,
    required super.passHidden,
    required this.authResponse,
  });

  final AuthResponse authResponse;
}
