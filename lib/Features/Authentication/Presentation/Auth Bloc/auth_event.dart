part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class TogglePassHiddenEvent extends AuthEvent {}

class GoogleLoginInitiated extends AuthEvent {}

class SetEmailValueEvent extends AuthEvent {
  final String email;

  SetEmailValueEvent({required this.email});
}

class SetPasswordValueEvent extends AuthEvent {
  final String password;

  SetPasswordValueEvent({required this.password});
}

class GoogleLoginCompleted extends AuthEvent {
  final String authCode;

  GoogleLoginCompleted(this.authCode);
}

class LoginUsingEmailEvent extends AuthEvent {
  final String email;
  final String password;

  LoginUsingEmailEvent({required this.email, required this.password});
}
