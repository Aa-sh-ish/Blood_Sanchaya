import 'package:flutter/material.dart';
class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Container(
        decoration: new BoxDecoration(
        gradient: new LinearGradient(
        colors: [
        Color(0xffF70010),
    Colors.white,
    ],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        )
        ),
    child: Scaffold(

    backgroundColor: Colors.transparent,
    body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text("Event Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),

    ),

    SizedBox(
    height: height*0.01,

    ),
      Container(
        height: height*0.01

      ),

        Image.asset('assets/Rectangle 2.png')

      ],
    ),

    )
    );

  }
}
