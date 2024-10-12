part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final int currentTabIndex;

  final String name;
  final String user_name;
  final String bio;
  final String address;
  final String gender;

  const ProfileState({
    this.currentTabIndex = 0,
    this.name = '',
    this.user_name = '',
    this.bio = '',
    this.address = '',
    this.gender = '',
  });

  ProfileState copyWith({
    int? currentTabIndex,
    String? name,
    String? user_name,
    String? bio,
    String? address,
    String? gender,
  }) {
    return ProfileState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      name: name ?? this.name,
      user_name: user_name ?? this.user_name,
      bio: bio ?? this.bio,
      address: address ?? this.address,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object> get props => [currentTabIndex, name, user_name, bio, address, gender];
}

class GetProfileSuccess extends ProfileState {
  final RegisterDataResponse registerData;

  const GetProfileSuccess({
    required this.registerData,
    super.currentTabIndex,
    super.name,
    super.user_name,
    super.bio,
    super.address,
    super.gender,
  });

  @override
  GetProfileSuccess copyWith({
    RegisterDataResponse? registerData,
    int? currentTabIndex,
    String? name,
    String? user_name,
    String? bio,
    String? address,
    String? gender,
  }) {
    return GetProfileSuccess(
      registerData: registerData ?? this.registerData,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      name: name ?? this.name,
      user_name: user_name ?? this.user_name,
      bio: bio ?? this.bio,
      address: address ?? this.address,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object> get props => [
    registerData,
    currentTabIndex,
    name,
    user_name,
    bio,
    address,
    gender,
  ];
}
