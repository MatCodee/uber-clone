import 'package:flutter/material.dart';
import 'package:workii/pages/client/map/client_map.dart';
import 'package:workii/pages/client/register/client_register_page.dart';
import 'package:workii/pages/driver/driver_register/driver_register_page.dart';
import 'package:workii/pages/driver/map/driver_map.dart';
import 'package:workii/pages/home/home_page.dart';
import 'package:workii/pages/login/login_page.dart';
import 'package:workii/pages/main/main_page.dart';

// rutas de la aplicacion}

Map<String, Widget Function(BuildContext)> routes = {
  'home': (BuildContext context) => HomePage(),

  // logue dentro de la aplicacion
  'login': (BuildContext context) => LoginPage(),

  // paginas de registro dentro de la aplicacion
  'client/register': (BuildContext context) => ClientRegisterPage(),
  'driver/register': (BuildContext context) => DriverRegisterPage(),

  // map dentro de la aplicacion
  'driver/map': (BuildContext context) => const DriverMapPage(),
  'client/map': (BuildContext context) => const ClientMapPage(),
  'main': (BuildContext context) => MainPage(),
};
