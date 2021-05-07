import 'dart:developer';

import 'package:equipos_pokemon/config/api.dart';
import 'package:http/http.dart' as http;

class ApiRest {
  Future<void> loadPokemons() async {
    Uri uri = Uri.https(Api.server, Api.getPokemons, {"limit": '15'});
    final request = await http.get(uri);
    log(request.body.toString());
    return request;
  }
}
