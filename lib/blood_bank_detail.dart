import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class BB_details extends StatefulWidget {
  const BB_details({super.key});

  @override
  State<BB_details> createState() => _BB_detailsState();
}

class _BB_detailsState extends State<BB_details> {
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
          backgroundColor: Color(0x000000),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Blood Bank XYZ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Bharatpur-11,Chitwan"),
                        Text("Bharatpur Hospital"),
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Color(0xffFE0011),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("01-111111"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Color(0xffFE0011),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("xyz@gmail.com"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Available Bloods",
                  style: TextStyle(
                      color: Color(0xfff70010), fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color(0xfff6e6e6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Status On 2022-12-13/04:02 PM   ",
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          color: Color(0xffE9E8EA),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Teext(text: "Blood Group"),
                              Teext(text: "Available"),
                              Teext(text: "Plasma"),
                              Teext(text: "Platelets")
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (() {
                              showAnimatedDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 400, left: 20, right: 20),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Book Blood A+ xx amount xx plateles",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image.asset(
                                                  "assets/Cancel.png",
                                                  width: screenwidth * 0.3,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.maybeOf(
                                                          context)
                                                      ?.showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          "Blood Booked Succesfully"),
                                                    ),
                                                  );
                                                },
                                                child: Image.asset(
                                                  "assets/Book.png",
                                                  width: screenwidth * 0.3,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                animationType: DialogTransitionType.size,
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(seconds: 1),
                              );
                            }),
                            child: Container(
                              width: screenwidth * 0.8,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Teext(text: "A+"),
                                    Teext(text: "XX"),
                                    Teext(text: "XX"),
                                    Teext(text: "XX")
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Teext extends StatelessWidget {
  Teext({required this.text});
  var text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
