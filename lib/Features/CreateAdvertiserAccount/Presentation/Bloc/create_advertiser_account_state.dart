part of 'create_advertiser_account_bloc.dart';

class CreateAdvertiserAccountState {
  bool passHidden;

  CreateAdvertiserAccountState({
    required this.passHidden,
  });

  CreateAdvertiserAccountState copyWith({
    bool? passHidden,
  }) =>
      CreateAdvertiserAccountState(
        passHidden: passHidden ?? this.passHidden,
      );
}
