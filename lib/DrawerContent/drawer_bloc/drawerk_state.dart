part of 'drawerk_bloc.dart';

@immutable
abstract class DrawerkState {}

class DrawerkInitial extends DrawerkState {}

class NavigateToProfileState extends DrawerkState{}
class NavigateToHomeState extends DrawerkState{}
class NavigateToSettingsState extends DrawerkState{}
class NavigateToLogoutState extends DrawerkState{}
