import 'package:blood_sanchaya/HomePage.dart';
import 'package:blood_sanchaya/signin.dart';
import 'package:blood_sanchaya/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: "Blood Sanchaya",
    );
  }
}
