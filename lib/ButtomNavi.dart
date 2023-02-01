import 'package:blood_sanchaya/Event%20and%20Help.dart';
import 'package:blood_sanchaya/Help_Post.dart';
import 'package:blood_sanchaya/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottonNav2 extends StatefulWidget {
  const BottonNav2({Key? key}) : super(key: key);

  @override
  State<BottonNav2> createState() => _BottonNav2State();
}

class _BottonNav2State extends State<BottonNav2> {
  int _currentState = 0;

  var pages = [HomePage(), Help_Post(), Event_and_Help()];

  void _onChange(int index) {
    setState(
      () {
        _currentState = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 500),
        color: Colors.redAccent,
        items: [
          Icon(
            Icons.home,
            size: 40,
          ),
          Icon(
            Icons.local_hospital,
            size: 40,
          ),
          Icon(
            Icons.newspaper_sharp,
            size: 40,
          ),
        ],
        onTap: _onChange,
      ),
      body: SafeArea(
        child: pages[_currentState],
      ),
    );
  }
}
