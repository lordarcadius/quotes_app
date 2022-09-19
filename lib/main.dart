import 'package:flutter/material.dart';
import 'app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("Main: main()");
  runApp(QuotesApp(
    isDark: await readPref("isDark"),
  ));
}

Future<bool> readPref(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}
