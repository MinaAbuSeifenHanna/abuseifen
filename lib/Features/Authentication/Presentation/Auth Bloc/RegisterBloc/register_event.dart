part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class OnPasswordChangedEvent extends RegisterEvent {
  OnPasswordChangedEvent({required this.password});

  final String password;
}

class OnEmailChangedEvent extends RegisterEvent {
  OnEmailChangedEvent({required this.email});

  final String email;
}

class OnPasswordConfirmationChangedEvent extends RegisterEvent {
  OnPasswordConfirmationChangedEvent({required this.password});

  final String password;
}

class TogglePassHiddenEvent extends RegisterEvent {}
class TogglePassConfirmationHiddenEvent extends RegisterEvent {}

class SubmitRegisterEvent extends RegisterEvent {}
