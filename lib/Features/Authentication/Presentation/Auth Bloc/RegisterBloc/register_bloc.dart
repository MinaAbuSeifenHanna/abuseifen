import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hypelify_v2/Core/Functions/app_validator.dart';

import '../../../../../Core/Failures/failures.dart';
import '../../../Domain/Entities/base_response.dart';
import '../../../Domain/Entities/register_data_response.dart';
import '../../../Domain/Repositories/auth_repository.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  static RegisterBloc get(BuildContext context) => BlocProvider.of(context);
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository})
      : super(const RegisterState(
          passHidden: true,
          passConfHidden: true,
        )) {
    on<OnPasswordChangedEvent>(_onChangePassword);
    on<OnPasswordConfirmationChangedEvent>(_onChangePasswordConfirmation);
    on<OnEmailChangedEvent>(_onChangeEmail);
    on<TogglePassHiddenEvent>((event, emit) => emit(state.copyWith(passHidden: !state.passHidden)));
    on<TogglePassConfirmationHiddenEvent>((event, emit) => emit(state.copyWith(passConfHidden: !state.passConfHidden)));
    on<SubmitRegisterEvent>(_submitRegister);
  }

  void _onChangePassword(OnPasswordChangedEvent event, Emitter<RegisterState> emit) {
    double linearValue = 0.0;
    if (event.password.length >= 8) {
      linearValue += 1 / 3;
    }
    if (AppValidator.containsNumeric(event.password)) {
      linearValue += 1 / 3;
    }
    if (AppValidator.containsSpecialCharacter(event.password)) {
      linearValue += 1 / 3;
    }
    emit(state.copyWith(password: event.password, linearValue: linearValue));
  }

  void _onChangeEmail(OnEmailChangedEvent event, Emitter<RegisterState> emit) =>
      emit(state.copyWith(email: event.email));

  void _onChangePasswordConfirmation(OnPasswordConfirmationChangedEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(passwordConfirmation: event.password));
  }

  FutureOr<void> _submitRegister(SubmitRegisterEvent event, Emitter<RegisterState> emit) async {
    EasyLoading.show();
    try {
      final Either<Failure, BaseResponse<RegisterDataResponse>> response =
          await authRepository.registerUsingEmail(state.email, state.password, state.passwordConfirmation);
      response.fold((failure) {
        EasyLoading.showError(failure.message);
      }, (authData) async {
        emit(SuccessRegisterState(response: authData));
      });
    } catch (error) {
      EasyLoading.showError(error.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
