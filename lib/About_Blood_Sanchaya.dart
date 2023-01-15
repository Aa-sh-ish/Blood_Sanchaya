import 'package:flutter/material.dart';
class About_Blood_Sanchaya extends StatelessWidget {
  const About_Blood_Sanchaya({super.key});

  @override
  Widget build(BuildContext context) {
    var name;
    var email;
    var linkedIn;
    return Container(
      height: 300,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Color(0xffEA5959),
              Color(0xffF5F5F5),
            ],
            begin: FractionalOffset.topRight,
            end: FractionalOffset.bottomLeft,
          )
      ),
      child: SafeArea(child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          leading: Image.asset("assets/blood.png"),
          title: Text("Donate Blood Save Life",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            child: Column(
              children: [
                Text("About Blood Sanchaya",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),

                ),
                SizedBox(
                  height: 30,

                ),
                Text("Blood Sanchaya is full service mobile application created with the motive of easy supply of blood over Nepal."),

              ],

            ),


            ),
          ),
        ),
      ),
      );

  }
}


