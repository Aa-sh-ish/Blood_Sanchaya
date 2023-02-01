import 'package:blood_sanchaya/google_map.dart';
import 'package:blood_sanchaya/HomePage.dart';
import 'package:blood_sanchaya/aboutUs.dart';
import 'package:blood_sanchaya/signin.dart';
import 'package:blood_sanchaya/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Khalti.init(
      publicKey: "test_public_key_158e96969237452c9be5e153dcbc391c",
      enabledDebugging: false);
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
