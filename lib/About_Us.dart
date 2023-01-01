import 'package:flutter/material.dart';
class About_us extends StatefulWidget {
  const About_us({Key? key}) : super(key: key);

  @override
  State<About_us> createState() => _About_usState();
}

class _About_usState extends State<About_us> {
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
            Text("About Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),

            ),
            SizedBox(
              height:height*0.01,

            ),
            Text("Blood Sanchaya is full service mobile application created with the motive of easy supply of blood over Nepal."),

          ],

      ),

    )
    );
  }
}

