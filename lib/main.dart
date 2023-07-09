import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoruz/landingpage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(// navigation bar color
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark// status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qoruz Assignmnet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        fontFamily: 'Gilroy Regular',
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}

