import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Feed_Back extends StatefulWidget {
  const Feed_Back({super.key});

  @override
  State<Feed_Back> createState() => _Feed_BackState();
}

class _Feed_BackState extends State<Feed_Back> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
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
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Image.asset("assets/Logo.png", width: screenwidth * 0.3),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Feel Free To Provide FeedBack",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your Every Comment is Accepted",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.02),
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
                    hintText: "Comments ",
                    //hintMaxLines: 0,
                    hintStyle: TextStyle(fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          BorderSide(color: Color(0xfff70010), width: 2),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Rate Us",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                RatingBar(
                    itemSize: 40,
                    allowHalfRating: true,
                    glowColor: Colors.red,
                    ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: Colors.yellow[400],
                        ),
                        half: Icon(Icons.star_half, color: Colors.yellow[400]),
                        empty: Icon(
                          Icons.star_border_outlined,
                        )),
                    onRatingUpdate: ((value) {
                      setState(() {
                        _rating = value;
                      });
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
