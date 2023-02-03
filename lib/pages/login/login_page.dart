import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:workii/pages/login/login_controller.dart';

import 'package:workii/utils/Colors.dart';
import 'package:workii/widgets/button_app.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = LoginController();

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
                SizedBox(height: MediaQuery.of(context).size.height*0.17,),
                _textFieldEmail(),
                _textFieldPass(),
                _buttonLogin(),
                _textDontHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _textDontHaveAccount() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      child: GestureDetector(
        onTap: _con.goToRefisterPage  ,
        child: Text("¿No tienes cuenta?",
        )
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
      child: ButtonApp(onPressed: _con.login,text: 'Iniciar Sesión')
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


  Widget _textDescription() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget> [
          Text("Continuar con tu",style: TextStyle(fontSize: 25.0,color: Colors.black54)),
          SizedBox(height: 10.0),
          Text("Login",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
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
