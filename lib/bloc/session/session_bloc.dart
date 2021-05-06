import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equipos_pokemon/config/preferences.dart';
import 'package:meta/meta.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final Preferences preferences;
  SessionBloc(this.preferences) : super(SessionState()) {
    final String user = preferences.user;
    if (user != null) {
      emit(state.copyWith(userSaved: true));
    } else {
      emit(state.copyWith(userSaved: false));
    }
  }

  @override
  Stream<SessionState> mapEventToState(
    SessionEvent event,
  ) async* {
    if (event is UserSaved) {
      yield state.copyWith(userSaved: event.value);
    }
    if (event is ChangeUserSaved) {
      yield state.copyWith(user: event.user);
    }
    if (event is SaveUser) {
      preferences.user = state.user;
      yield state.copyWith(userSaved: true);
    }
  }
}
