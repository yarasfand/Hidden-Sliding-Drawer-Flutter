part of 'drawerk_bloc.dart';

@immutable
abstract class DrawerkEvent {}
abstract class DrawerkActionEvent extends DrawerkEvent {}
class NavigateToProfileEvent extends DrawerkActionEvent{}
class NavigateToHomeEvent extends DrawerkActionEvent{}
class NavigateToSettingsEvent extends DrawerkActionEvent{}
class NavigateToLogoutEvent extends DrawerkActionEvent{}
