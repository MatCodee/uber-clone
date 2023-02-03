import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {

  Future<void> save(String key,String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future.value(json.decode(prefs.getString(key) as String));
  }

  // Este metodo ve si existe un valor con una key establecida
  Future<bool> contains(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key!);
  }

  Future<dynamic> remove(String? key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key!);
  }
}