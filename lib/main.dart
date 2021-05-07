import 'dart:async';

import 'package:equipos_pokemon/bloc/session/session_bloc.dart';
import 'package:equipos_pokemon/config/preferences.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equipos_pokemon/config/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Preferences pref = new Preferences();
  await pref.initPrefts();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Preferences pref = new Preferences();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SessionBloc>(
          create: (context) => SessionBloc(pref),
        )
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;
  @override
  Widget build(BuildContext context) {
    final _sessionBloc = context.watch<SessionBloc>();
    return MaterialApp(
      navigatorKey: _navigatorKey,
      onGenerateRoute: routes,
      initialRoute: _sessionBloc.state.userSaved == null
          ? "launch"
          : _sessionBloc.state.userSaved
              ? 'home'
              : 'register',
      builder: (context, child) => BlocListener<SessionBloc, SessionState>(
        listenWhen: (previous, current) =>
            previous.userSaved != current.userSaved,
        child: child,
        listener: (context, state) {
          if (state.userSaved) {
            _navigator.pushReplacementNamed('home');
          } else {
            _navigator.pushReplacementNamed('register');
          }
        },
      ),
    );
  }
}
