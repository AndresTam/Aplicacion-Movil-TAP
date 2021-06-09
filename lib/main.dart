import 'package:flutter/material.dart';
import 'package:practica2_tap/screens/conversor_screen.dart';
import 'package:practica2_tap/screens/intenciones_screen.dart';
import 'package:practica2_tap/screens/dashboard_screen.dart';
import 'package:practica2_tap/screens/login_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/dashboard'   : (context) => DashboardScreen(),
        '/intenciones' : (context) => IntencionesScreen(),
        '/conversor'   : (context) => ConversorScreen(),
        
      },
    );
  }
}