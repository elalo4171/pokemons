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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        if (state.userSaved == null) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (!state.userSaved) {
          return MaterialApp(
            title: 'Material App',
            initialRoute: 'register',
            onGenerateRoute: routes,
          );
        }
        return MaterialApp(
          title: 'Material App',
          initialRoute: 'home',
          onGenerateRoute: routes,
        );
      },
    );
  }
}
