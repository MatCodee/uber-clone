

import 'package:flutter/material.dart';
import 'package:workii/providers/auth_provider.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:workii/utils/shared_pref.dart';


class LoginController {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthProvider? _authProvider;
  ProgressDialog? _pd;

  SharedPref? _sharedPrefs;
  String? _typeUser;

  Future? init(BuildContext context) async {
    this.context = context;
    _authProvider = AuthProvider();
    _pd = ProgressDialog(context: context);
    _sharedPrefs = SharedPref();
    _typeUser = await _sharedPrefs!.read('typeUser') ?? "" ;

    print("==== tipo de usuario");
    print(_typeUser);
    print("client");
    
  }

  void login() async {
    String email = emailController.text.trim();
    String pass = passwordController.text.trim();
    print("cargando datos");
    print("email: ${email} pass: ${pass}");

    bool? response;
    try { 
      response = await _authProvider?.login(email, pass);
    }catch(e) {
      print(e);
    }
    /*
      _pd?.show(
      max: 100,
      msg: 'Espere un momento...',
      progressType: ProgressType.valuable, 
    );
    */

    if(response!) {
      //Navigator.pushNamed(context!, 'main');
      Navigator.pushNamed(context!,'client/map');
    }else {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(content: Text("Correo y/o Contraseña Incorrectos"),));      return;
    }
  }

  void goToRefisterPage() {
    print(_typeUser.toString() == "client".toString());
    if(_typeUser.toString() == "client".toString()) {
      print("entro en client");
      Navigator.pushNamed(context!, 'client/register');
    }else {
      print("entro en driver");
      Navigator.pushNamed(context!, 'driver/register');
    }
  }
}