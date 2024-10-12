import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Features/Home/Presentation/View/home_screen.dart';
import '../../../Core/Routes/routes.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

  static BottomNavigationBarCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<Widget> get pageOptions => [
        HomeScreen(),
        Scaffold(),
        BlocProviders.provideReelsScreen,
        BlocProviders.provideBlocProfileWithProfileScreen,
      ];

  int index = 0;

  void setIndex(int index) {
    this.index = index;
    emit(IndexChangeState());
  }
}
