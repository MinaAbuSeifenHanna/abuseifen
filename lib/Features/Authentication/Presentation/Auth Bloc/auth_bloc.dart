import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/auth_response.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Core/Failures/failures.dart';
import '../../Domain/Repositories/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository)
      : super(
          AuthInitial(
            isVisible: false,
            isPasswordEightCharacters: false,
            hasPasswordOneNumber: false,
            passHidden: true,
          ),
        ) {
    on<TogglePassHiddenEvent>((event, emit) {
      if (state is AuthInitial) {
        emit(state.copyWith(passHidden: !state.passHidden));
      }
    });
    on<GoogleLoginInitiated>(_googleLoginInitiated);
    on<LoginUsingEmailEvent>(_loginUsingEmail);
    on<SetEmailValueEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<SetPasswordValueEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }

  FutureOr<void> _googleLoginInitiated(GoogleLoginInitiated event, Emitter<AuthState> emit) async {
    EasyLoading.show();
    try {
      final Either<Failure, String> response = await _authRepository.authUsingGoogle();
      response.fold((failure) {
        print("googleAuthUrl failure= ${failure.message}");
        emit(AuthFailure(
          message: failure.message,
          isVisible: state.isVisible,
          isPasswordEightCharacters: state.isPasswordEightCharacters,
          hasPasswordOneNumber: state.hasPasswordOneNumber,
          passHidden: state.passHidden,
        ));
      }, (googleAuthUrl) async {
        print("googleAuthUrl = $googleAuthUrl");
        if (await canLaunchUrl(Uri.parse(googleAuthUrl))) {
          await launchUrl(Uri.parse(googleAuthUrl), mode: LaunchMode.externalApplication);
          emit(AuthUrlLoaded(
            googleAuthUrl: googleAuthUrl,
            isVisible: state.isVisible,
            isPasswordEightCharacters: state.isPasswordEightCharacters,
            hasPasswordOneNumber: state.hasPasswordOneNumber,
            passHidden: state.passHidden,
          ));
        } else {
          print("googleAuthUrl !canLaunchUrl= $googleAuthUrl");
        }
      });
    } catch (error) {
      print("googleAuthUrl catch= ${error.toString()}");
      emit(
        AuthFailure(
          message: error.toString(),
          isVisible: state.isVisible,
          isPasswordEightCharacters: state.isPasswordEightCharacters,
          hasPasswordOneNumber: state.hasPasswordOneNumber,
          passHidden: state.passHidden,
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  FutureOr<void> _loginUsingEmail(LoginUsingEmailEvent event, Emitter<AuthState> emit) async {
    EasyLoading.show();
    try {
      final Either<Failure, AuthResponse> response =
          await _authRepository.loginUsingEmail(event.email, event.password);
      response.fold((failure) {
        EasyLoading.showError(failure.message);
      }, (authData) async {
        emit(
          LoginUsingEmailSuccessState(
            isVisible: state.isVisible,
            isPasswordEightCharacters: state.isPasswordEightCharacters,
            hasPasswordOneNumber: state.hasPasswordOneNumber,
            passHidden: state.passHidden,
            authResponse: authData,
          ),
        );
      });
    } catch (error) {
      EasyLoading.showError(error.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
