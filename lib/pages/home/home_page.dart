import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:workii/pages/home/home_controller.dart';
import 'package:workii/utils/colors.dart';


class HomePage extends StatelessWidget {
  
  final HomeController _con = HomeController();

  @override
  Widget build(BuildContext context) {
    _con.init(context); // inicializando el controlador de esta pagina

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ColorsStyle.uber_black,Colors.black],
            )
          ),
          child: Column(
            children: [
              ClipPath(
                clipper: DiagonalPathClipperTwo(),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height*0.30,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/img/logo_app.png",width: 150,height: 100,),
                    const Text("Facil y Rapido",),
                  ],
              ),
                ),
              ),

              const SizedBox(height: 50.0,),
              const Text("Selecciona tu rol",style: TextStyle(color: Colors.white,fontSize: 20.0)),
              const SizedBox(height: 30.0,),
              GestureDetector(
                onTap: () => _con.goToLoginPage(context,'client'),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/img/pasajero.png"),
                  backgroundColor: Colors.black,
                  radius: 50
                ),
              ),
              const SizedBox(height: 10.0,),
              const Text("Cliente",style: TextStyle(color: Colors.white)),
              const SizedBox(height: 30.0,),
              GestureDetector(
                onTap: () => _con.goToLoginPage(context,'driver'),  
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/img/driver.png"),
                  backgroundColor: Colors.black,
                  radius: 50
                ),
              ),
              const SizedBox(height: 10.0,),
              const Text("Conductor",style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }

  void goToLoginPage(BuildContext context) {
    Navigator.pushNamed(context, 'login');
  }
}