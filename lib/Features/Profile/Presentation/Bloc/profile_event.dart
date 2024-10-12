part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

// Update Tab Index Event
class UpdateTabIndex extends ProfileEvent {
  final int newIndex;

  const UpdateTabIndex(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

class GetProfileEvent extends ProfileEvent {}

class GetProfileDataFromCacheEvent extends ProfileEvent {
  final String? name;
  final String? user_name;
  final String? bio;
  final String? address;
  final String? gender;

  const GetProfileDataFromCacheEvent({
    this.name,
    this.user_name,
    this.bio,
    this.address,
    this.gender,
  });
}

class OnChangeNameEvent extends ProfileEvent {
  final String name;

  const OnChangeNameEvent({required this.name});
}

class OnChangeUserNameEvent extends ProfileEvent {
  final String user_name;

  const OnChangeUserNameEvent({required this.user_name});
}

class OnChangeBioEvent extends ProfileEvent {
  final String bio;

  const OnChangeBioEvent({required this.bio});
}

class OnChangeAddressEvent extends ProfileEvent {
  final String address;

  const OnChangeAddressEvent({required this.address});
}

class OnChangeGenderEvent extends ProfileEvent {
  final String gender;

  const OnChangeGenderEvent({required this.gender});
}

class UpdateProfileEvent extends ProfileEvent {}
