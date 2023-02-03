import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workii/providers/auth_provider.dart';
import 'package:workii/utils/shared_pref.dart';


class HomeController {
  BuildContext? context;
  SharedPref? _sharedPrefs;
  AuthProvider? _authProvider;

  Future? init(BuildContext context) {
    this.context = context;
    _sharedPrefs = SharedPref();
  }
  
  void goToLoginPage(BuildContext context,String typeUser) {
    saveTypeUser(typeUser);
    Navigator.pushNamed(context,'login');
  }

  void saveTypeUser(String typeUser) async {
    await _sharedPrefs?.save('typeUser', typeUser);
  }

}