part of 'session_bloc.dart';

@immutable
abstract class SessionEvent {}

class InitialSession extends SessionEvent {}

class UserSaved extends SessionEvent {
  final bool value;
  UserSaved(this.value);
}

class ChangeUserSaved extends SessionEvent {
  final String user;
  ChangeUserSaved(this.user);
}

class SaveUser extends SessionEvent {}
