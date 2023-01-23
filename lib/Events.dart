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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffEA5959), Color(0xffF5F5F5)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[300],
            leading: Image.asset("assets/Drop.png"),
            title: Text(
              "Donate Blood Save Life",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: height * 0.02),
                Text(
                  "Event Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  minLines: 9,
                  maxLines: 30,
                  decoration: InputDecoration(
                    filled: true,

                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2,
                      ),
                    ),
                    hintText: "Describe Event",
                    //hintMaxLines: 0,
                    hintStyle: TextStyle(fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          BorderSide(color: Color(0xfff70010), width: 2),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/Post.png',
                  width: width * 0.4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
