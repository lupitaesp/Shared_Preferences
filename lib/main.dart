import 'package:flutter/material.dart';
import 'package:flutterappusuario/registroo.dart';
import 'registroo.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Usuario',
      home: Registro(),
    );
  }
}