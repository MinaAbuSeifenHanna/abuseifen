part of 'create_advertiser_account_bloc.dart';

@immutable
sealed class CreateAdvertiserAccountEvent {}

class TogglePassHiddenEvent extends CreateAdvertiserAccountEvent {}
