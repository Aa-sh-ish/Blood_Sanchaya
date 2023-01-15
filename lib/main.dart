import 'dart:html';

import 'package:blood_sanchaya/About_Blood_Sanchaya.dart';
import 'package:blood_sanchaya/About_Us.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title:"Blood Sanchaya",
      home: About_Us(),
      debugShowCheckedModeBanner: false,
    );
  }
}