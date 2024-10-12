import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hypelify_v2/Core/Failures/failures.dart';
import 'package:hypelify_v2/Core/Handler/auth_handler.dart';
import 'package:hypelify_v2/Core/Helpers/dependency_injection_helper.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/base_response.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/register_data_response.dart';

import '../../Domain/Repositories/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  static ProfileBloc get(BuildContext context) => BlocProvider.of(context);

  ProfileBloc({required this.profileRepository}) : super(const ProfileState()) {
    on<UpdateTabIndex>(_onUpdateTabIndex);
    on<GetProfileEvent>(_getProfile);
    on<GetProfileDataFromCacheEvent>(_getProfileDateFromCache);
    on<UpdateProfileEvent>(_updateProfile);

    on<OnChangeNameEvent>((event, emit) => emit(state.copyWith(name: event.name)));
    on<OnChangeUserNameEvent>((event, emit) => emit(state.copyWith(user_name: event.user_name)));
    on<OnChangeBioEvent>((event, emit) => emit(state.copyWith(bio: event.bio)));
    on<OnChangeAddressEvent>((event, emit) => emit(state.copyWith(address: event.address)));
    on<OnChangeGenderEvent>((event, emit) => emit(state.copyWith(gender: event.gender)));
  }

  void _onUpdateTabIndex(UpdateTabIndex event, Emitter<ProfileState> emit) {
    emit(state.copyWith(currentTabIndex: event.newIndex));
  }

  FutureOr<void> _getProfile(GetProfileEvent event, Emitter<ProfileState> emit) async {
    final Either<Failure, BaseResponse<RegisterDataResponse>> result = await profileRepository.getProfile();
    result.fold(
      (failure) {},
      (data) {
        DependencyInjectionHelper().sl<AuthHandlerInterface>().setUserData(data.data);
        emit(GetProfileSuccess(registerData: data.data));
      },
    );
  }

  void _getProfileDateFromCache(GetProfileDataFromCacheEvent event, Emitter<ProfileState> emit) => emit(
        state.copyWith(
          name: event.name,
          user_name: event.user_name,
          bio: event.bio,
          address: event.address,
          gender: event.gender,
        ),
      );

  FutureOr<void> _updateProfile(UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    EasyLoading.show();
    final Either<Failure, BaseResponse<RegisterDataResponse>> result = await profileRepository.updateProfile({
      'name': state.name,
      'user_name': state.user_name,
      'bio': state.bio,
      'address': state.address,
      'gender': state.gender,
    });
    result.fold(
      (failure) {
        EasyLoading.dismiss();
        EasyLoading.showError(failure.message);
      },
      (data) {
        DependencyInjectionHelper().sl<AuthHandlerInterface>().setUserData(data.data);
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Profile Updated Successfully $state');
        emit(GetProfileSuccess(registerData: data.data));
      },
    );
  }
}
