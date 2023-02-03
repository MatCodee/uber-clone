import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';



class DriverMapPage extends StatefulWidget {
  const DriverMapPage({super.key});

  @override
  State<DriverMapPage> createState() => _DriverMapPageState();
}

class _DriverMapPageState extends State<DriverMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('MAPA DEL CONDUCTOR')),
    );
  }
}