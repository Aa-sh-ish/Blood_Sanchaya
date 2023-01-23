import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date_Update extends StatefulWidget {
  const Date_Update({super.key});

  @override
  State<Date_Update> createState() => _Date_UpdateState();
}

class _Date_UpdateState extends State<Date_Update> {
  DateTime next = DateTime.now();

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
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/Logo.png",
                  width: screenwidth * 0.3,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "You Have Donate Blood On",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(next),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                SizedBox(height: screenHeight * 0.02),
                GestureDetector(
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: next,
                        firstDate: DateTime(2001, 8),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != next) {
                        setState(() {
                          next = picked;
                        });
                      }
                      DateTime _NewDate = next.add(Duration(days: 90));

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return SimpleDialog(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Thank You For Donating Blood You Have earned some rewards",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "You Can Again Donate Blood On: ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          DateFormat.yMMMMEEEEd()
                                              .format(_NewDate),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.lightGreen,
                                            ),
                                            child: Text("Notify Me"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red[300],
                                            ),
                                            child: Text("Thank You"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(width: screenwidth * 0.2),
                        Image.asset(
                          "assets/Update.png",
                          width: screenwidth * 0.4,
                        ),
                        Icon(
                          Icons.calendar_month_rounded,
                          size: 50,
                          color: Colors.red[700],
                        )
                      ],
                    )),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "You Can Donate Blood On",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(next.add(Duration(days: 91))),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
