import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_advertiser_account_event.dart';

part 'create_advertiser_account_state.dart';

class CreateAdvertiserAccountBloc extends Bloc<CreateAdvertiserAccountEvent, CreateAdvertiserAccountState> {
  CreateAdvertiserAccountBloc()
      : super(CreateAdvertiserAccountState(
          passHidden: true,
        )) {
    on<CreateAdvertiserAccountEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TogglePassHiddenEvent>((event, emit) {
      emit(state.copyWith(passHidden: !state.passHidden));
    });
  }
}
