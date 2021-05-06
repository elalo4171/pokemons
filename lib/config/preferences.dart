import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instancia = new Preferences._internal();

  factory Preferences() {
    return _instancia;
  }

  Preferences._internal();

  SharedPreferences prefs;
  initPrefts() async {
    prefs = await SharedPreferences.getInstance();
  }

  cleanPrefts() async {
    await prefs.clear();
  }

  get user {
    final userData = prefs.get('user');
    return userData;
  }

  set user(String value) {
    prefs.setString('user', value);
  }
}
