part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String password;
  final String passwordConfirmation;
  final String email;
  final double linearValue;
  final bool passHidden;
  final bool passConfHidden;

  const RegisterState({
    this.password = '',
    this.passwordConfirmation = '',
    this.email = '',
    this.linearValue = 0,
    required this.passHidden,
    required this.passConfHidden,
  });

  RegisterState copyWith({
    String? password,
    String? passwordConfirmation,
    String? email,
    double? linearValue,
    bool? passHidden,
    bool? passConfHidden,
  }) =>
      RegisterState(
        password: password ?? this.password,
        passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
        email: email ?? this.email,
        linearValue: linearValue ?? this.linearValue,
        passHidden: passHidden ?? this.passHidden,
        passConfHidden: passConfHidden ?? this.passConfHidden,
      );

  @override
  List<Object?> get props => [
        password,
        passwordConfirmation,
        linearValue,
        email,
        passHidden,
    passConfHidden
      ];
}

class SuccessRegisterState extends RegisterState {
  const SuccessRegisterState({
    super.password = '',
    super.passwordConfirmation = '',
    super.email = '',
    super.linearValue = 0,
    super.passHidden = true,
    super.passConfHidden  = true,
    required this.response,
  });

  final BaseResponse<RegisterDataResponse> response;
}
