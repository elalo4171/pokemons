part of 'session_bloc.dart';

class SessionState {
  final bool userSaved;
  final String user;

  SessionState({this.userSaved, this.user});

  SessionState copyWith({
    bool userSaved,
    String user,
  }) =>
      SessionState(
          userSaved: userSaved ?? this.userSaved, user: user ?? this.user);
}
