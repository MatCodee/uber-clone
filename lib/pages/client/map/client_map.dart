import 'package:flutter/material.dart';


class ClientMapPage extends StatefulWidget {
  const ClientMapPage({super.key});

  @override
  State<ClientMapPage> createState() => _ClientMapPageState();
}

class _ClientMapPageState extends State<ClientMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Mapa del Cliente"),),
    );
  }
}