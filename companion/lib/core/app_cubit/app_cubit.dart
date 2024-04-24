import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:companion/features/preparing/screens/test_pointing_components.dart';

part 'app_states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial());

  // void onUpdateData(String lang) {
  //   emit(AppData(lang: lang, changed: !state.changed));
  // }

  static AppCubit get(context) => BlocProvider.of(context);
  ComponentWidget? componentWidget;

  void change({ComponentWidget? componentWidget}) {
    log("inside");
    this.componentWidget = componentWidget;
    emit(changestate());
  }

  int currentIndex = 1;
  void changeCurrentregisterScreen(currentScreen) {
    currentIndex = currentScreen;
    emit(ChangeCurrentRegisterScreen());
  }

  void navigation(context, ComponentWidget current, ComponentWidget direction) {
    if (direction == current.left) {
      componentWidget = current.left;
    } else if (direction == current.top) {
      componentWidget = current.top;
    } else if (direction == current.bottom) {
      componentWidget = current.bottom;
    } else if (direction == current.right) {
      componentWidget = current.right;
    }

    emit(ChangeCurrentChild());
  }
}
