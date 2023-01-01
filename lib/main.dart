import 'package:blood_sanchaya/help.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Sanchaya',
      debugShowCheckedModeBanner: false,
      home: Help(),
    );
  }
}
