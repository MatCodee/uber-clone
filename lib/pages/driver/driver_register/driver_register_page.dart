import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:workii/pages/driver/driver_register/driver_register_controller.dart';

import 'package:workii/utils/Colors.dart';
import 'package:workii/utils/otp_widget.dart';
import 'package:workii/widgets/button_app.dart';


class DriverRegisterPage extends StatefulWidget {

  @override
  State<DriverRegisterPage> createState() => _DriverRegisterPageState();
}

class _DriverRegisterPageState extends State<DriverRegisterPage> {
  DriverRegisterController _con = DriverRegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsStyle.uber_black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _bannerApp(),
                _textDescription(),
                _textLicencePlate(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: OTPFields(
                    pin1: _con.pin1Controller,
                    pin2: _con.pin2Controller,
                    pin3: _con.pin3Controller,
                    pin4: _con.pin4Controller,
                    pin5: _con.pin5Controller,
                    pin6: _con.pin6Controller,

                  ),
                ),
                _textFieldUsername(),
                _textFieldEmail(),
                _textFieldPass(),
                _textFieldConfirmPass(),
                _buttonRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textLicencePlate() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
      alignment: Alignment.centerLeft,
      child:  const Text("placa de Vehiculo",style: TextStyle(color: Colors.grey,fontSize: 17,)),
    );
  }

  Widget _buttonRegister() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
      child: ButtonApp(onPressed: _con.register,text: 'Registrarse')
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: _con.emailController,
        decoration: const InputDecoration(
          hintText: 'example@gmail.com',
          labelText: 'correo electronico',
          suffixIcon: Icon(Icons.email_outlined),
        ),
      ),
    );
  }


  Widget _textFieldUsername() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: _con.usernameController,
        decoration: const InputDecoration(
          hintText: 'Matias23',
          labelText: 'Nombre de Usuario',
          suffixIcon: Icon(Icons.person_outline),
        ),
      ),
    );
  }

  Widget _textFieldPass() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: const InputDecoration(
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock_open_outlined),
        ),
      ),
    );
  }

    Widget _textFieldConfirmPass() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        obscureText: true,
        controller: _con.confirmpasswordController,
        decoration: const InputDecoration(
          labelText: 'Confirmar Contraseña',
          suffixIcon: Icon(Icons.lock_reset_outlined),
        ),
      ),
    );
  }


  Widget _textDescription() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget> [
          SizedBox(height: 10.0),
          Text("Registro Driver",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  Widget _bannerApp() {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: ColorsStyle.uber_black,
        height: MediaQuery.of(context).size.height * 0.22,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/img/logo_app.png",
              width: 150,
              height: 100,
            ),
            const Text(
              "Facil y Rapido",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
