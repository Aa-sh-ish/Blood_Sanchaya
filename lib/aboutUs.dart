import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        colors: [
          Color(0xffEA5959),
          Color(0xffF5F5F5),
        ],
        begin: FractionalOffset.topRight,
        end: FractionalOffset.bottomLeft,
      )),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[300],
            leading: Image.asset("assets/Drop.png"),
            title: Text(
              "Donate Blood Save Life",
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "About Us",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "XXXxxXXX is full service mobile application  created with the motive of easy supply of blood over Nepal."),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Our Team"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      contnr(
                          name: "Pragarti",
                          email: "xxxxx.xxxxxx@",
                          linkedin: "aaaaa"),
                      contnr(
                          name: "Aashish",
                          email: "aaaa",
                          linkedin: "asdkfhashdf")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      contnr(name: 'Isha', email: "ishs...@", linkedin: "isha"),
                      contnr(
                          name: "Sanrso", email: "sntp@...", linkedin: "snts")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class contnr extends StatelessWidget {
  contnr({required this.name, required this.email, required this.linkedin});

  var name;
  var email;
  var linkedin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.asset("assets/Logo.png"),
          Text("$name"),
          Text("$email"),
          Text("$linkedin")
        ],
      ),
    );
  }
}
