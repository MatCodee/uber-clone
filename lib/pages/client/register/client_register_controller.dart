

import 'package:flutter/material.dart';
import 'package:workii/models/client.dart';
import 'package:workii/providers/auth_provider.dart';
import 'package:workii/providers/client_provider.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';


class ClientRegisterController {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();


  // dependencias de firebase
  AuthProvider? _authProvider;
  ClientProvider? _clientProvider;

  ProgressDialog? _pd;


  Future? init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _clientProvider = ClientProvider();
    _pd = ProgressDialog(context: context);
  }

  void register() async {
    String email = emailController.text;
    String pass = passwordController.text.trim();
    String username = usernameController.text.trim();
    String cpass = confirmpasswordController.text.trim();

    print("cargando datos");
    print("username: ${username} email: ${email} pass: ${pass} confirmPass: ${cpass}");  

    if(username.isEmpty && email.isEmpty && pass.isEmpty && cpass.isEmpty) {
      print("El usuario debe ingresar todos los campos");
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(content: Text("El usuario debe ingresar todos los campos"),));      return;
      return;
    }
    if(cpass != pass) {
      print("Las contraseñas deben ser iguales");
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(content: Text("Las contraseñas deben ser iguales!"),));      return;
      return;
    }
    if(pass.length < 6) {
      print("El password debe tener almenos 6 caracteres");
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(content: Text("El password debe tener almenos 6 caracteres"),));      return;
      return;
    }

    /*
    _pd?.show(
      max: 100,
      msg: 'Espere un momento...',
      progressType: ProgressType.valuable,
    );
    */

    bool? response;
    try { 
      response = await _authProvider!.register(username,email,pass,cpass);
    }catch(e) {
      print(e);
    }
    if(response!) {
      
      Client newClient = Client(
        id: _authProvider!.getUser()!.uid,
        email: _authProvider!.getUser()!.email!,
        username: username,
        password: pass
      );

      await _clientProvider!.create(newClient);
      print("entro aqui");
      Navigator.pushNamed(context!, 'main');
    }  
  }
  
}