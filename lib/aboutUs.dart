import 'package:flutter/material.dart';

class About_Us extends StatelessWidget {
  const About_Us({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: double.maxFinite,
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
            leading: Image.asset("assets/Logo.png"),
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
                    height: 10,
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
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          contain(
                            name: "Aashish Lamsal",
                            email: "aashish33lamsal@gmail.com ",
                            linkedIn: "Aashish Lamshal",
                            image: "assets/aas.jpg",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          contain(
                            name: "Isha Adhikari",
                            email: "ishuadhikari398@gmail.com",
                            linkedIn: "Isha Adhikari",
                            image: "assets/ish.jpg",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          contain(
                            name: "Pragati Baniya",
                            email: "pragatibaniya62@gmail.com",
                            linkedIn: "Pragati Baniya",
                            image: "assets/pp.jpg",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          contain(
                            name: "Santosh Mishra",
                            email: "santoshmishra6663@gmail.com",
                            linkedIn: "Santosh Mishra",
                            image: "assets/sante.jpg",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class contain extends StatefulWidget {
  var linkedIn;
  var name;
  var email;
  var image;

  contain(
      {required this.name,
      required this.email,
      required this.linkedIn,
      required this.image});

  @override
  State<contain> createState() => _containState();
}

class _containState extends State<contain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(children: [
          Image.asset(
            "${widget.image}",
            height: 60,
            width: 60,
          ),
          Row(
            children: [
              Icon(Icons.person),
              Text("${widget.name}"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.mail),
              Container(
                width: 175,
                child: Text(
                  "${widget.email}",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            children: [
             // Icon(""),
              Text("${widget.linkedIn}"),
            ],
          ),
        ]),
      ),
    );
  }
}
