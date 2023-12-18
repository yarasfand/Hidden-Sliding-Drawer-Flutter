import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawerk_event.dart';
part 'drawerk_state.dart';

class DrawerkBloc extends Bloc<DrawerkEvent, DrawerkState> {
  DrawerkBloc() : super(DrawerkInitial()) {
    on<NavigateToProfileEvent>(navigateToProfileEvent);
    on<NavigateToSettingsEvent>(navigateToASettingsEvent);
    on<NavigateToLogoutEvent>(navigateToLogoutEvent);
    on<NavigateToHomeEvent>(navigateToHomeEvent);


  }

  FutureOr<void> navigateToProfileEvent(NavigateToProfileEvent event, Emitter<DrawerkState> emit) {

    emit(NavigateToProfileState());

  }

  FutureOr<void> navigateToASettingsEvent(NavigateToSettingsEvent event, Emitter<DrawerkState> emit) {
    emit(NavigateToSettingsState());

  }

  FutureOr<void> navigateToLogoutEvent(NavigateToLogoutEvent event, Emitter<DrawerkState> emit) {
    emit(NavigateToLogoutState());

  }

  FutureOr<void> navigateToHomeEvent(NavigateToHomeEvent event, Emitter<DrawerkState> emit) {
    emit(NavigateToHomeState());
  }
}
