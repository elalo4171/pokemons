import 'package:equipos_pokemon/bloc/session/session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionBloc = context.watch<SessionBloc>();
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Ingresa tu usuario"),
        TextFormField(
          onChanged: (value) {
            sessionBloc.add(ChangeUserSaved(value));
          },
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          child: Text("Guardar Usuario"),
          onPressed: () {
            if (sessionBloc.state.user.length > 0) {
              sessionBloc.add(SaveUser());
            }
          },
        )
      ],
    ));
  }
}
