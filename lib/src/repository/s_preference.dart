import 'package:shared_preferences/shared_preferences.dart';

Future setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("Token", value);
}

Future getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("Token");
}

Future rmvToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("Token");
}

Future setRole(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("Role", value);
}

Future getRole() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("Role");
}

Future rmvRole() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("Role");
}
