// ignore_for_file: override_on_non_overriding_member

part of 'app_cubit.dart';

abstract class AppState {
  const AppState();
}

class AppInitial extends AppState {
  const AppInitial();
}

// ignore: camel_case_types
class changestate extends AppState {}

class ChangeCurrentChild extends AppState {}

class ChangeCurrentRegisterScreen extends AppState {}
