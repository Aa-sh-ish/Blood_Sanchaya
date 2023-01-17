import 'package:flutter/material.dart';

class Msg extends StatefulWidget {
  const Msg({Key? key}) : super(key: key);

  @override
  State<Msg> createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  var size, height, width;
  final List<String> bloods = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          title: Row(
            children: [
              // SizedBox(
              //   width: 0.01 * width,
              // ),
              Image.asset(
                "asset/Drop.png",
                width: height * 0.03,
              ),
              SizedBox(
                width: 0.1 * width,
              ),
              Text(
                "Keep Donating Blood",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Container(
          child: Text(
            'Updated Sucessfully',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
