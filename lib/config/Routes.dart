import 'package:equipos_pokemon/pages/launch_page.dart';
import 'package:flutter/material.dart';

import 'package:equipos_pokemon/pages/home_page.dart';
import 'package:equipos_pokemon/pages/register_user.dart';

Route Function(RouteSettings) get routes => (RouteSettings settings) {
      Route route;

      switch (settings.name) {
        case "launch":
          route = MaterialPageRoute(
              builder: (_) => LaunchPage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "home":
          route = MaterialPageRoute(
              builder: (_) => HomePage(),
              settings: RouteSettings(name: settings.name));
          break;
        case "register":
          route = MaterialPageRoute(
              builder: (_) => RegisterUser(),
              settings: RouteSettings(name: settings.name));
          break;
        default:
          route = MaterialPageRoute(builder: (_) => DefaultPage());
          break;
      }
      return route;
    };

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Text("This page is a fanta-sea."),
      ),
    );
  }
}
