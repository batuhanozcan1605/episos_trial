import 'package:episos_trial/screens/detailed_screen.dart';
import 'package:episos_trial/screens/home_screen.dart';
import 'package:episos_trial/screens/nav_screen.dart';
import 'package:episos_trial/screens/wellcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Episos Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        backgroundColor: Color(0x0003101a),
        scaffoldBackgroundColor: Color(0xff03101a),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavScreen(),
    );
  }
}

