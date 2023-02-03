

import 'package:flutter/material.dart';
import 'package:workii/models/Driver.dart';
import 'package:workii/providers/auth_provider.dart';
import 'package:workii/providers/client_provider.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:workii/providers/driver_provider%20copy.dart';


class DriverRegisterController {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();


  // input de la placa de Vehiculo:
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();


  // dependencias de firebase
  AuthProvider? _authProvider;
  DriverProvider? _driverProvider;

  ProgressDialog? _pd;


  Future? init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _driverProvider = DriverProvider();
    _pd = ProgressDialog(context: context);
  }

  void register() async {
    String email = emailController.text;
    String pass = passwordController.text.trim();
    String username = usernameController.text.trim();
    String cpass = confirmpasswordController.text.trim();

    // Capturar los campos de de la patente del vehivulo:
    String pin1 = pin1Controller.text.trim();
    String pin2 = pin2Controller.text.trim();
    String pin3 = pin3Controller.text.trim();
    String pin4 = pin4Controller.text.trim();
    String pin5 = pin5Controller.text.trim();
    String pin6 = pin6Controller.text.trim();


    String plate = '$pin1-$pin2-$pin3-$pin4-$pin5-$pin6';


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
      
      Driver newDriver = Driver(
        id: _authProvider!.getUser()!.uid,
        email: _authProvider!.getUser()!.email!,
        username: username,
        plate: plate,
      );

      await _driverProvider!.create(newDriver);
      print("entro aqui");
      Navigator.pushNamed(context!, 'main');
    }  
  }
  
}