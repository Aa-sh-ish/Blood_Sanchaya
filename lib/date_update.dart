import 'package:blood_sanchaya/Providers/userProvider.dart';
import 'package:blood_sanchaya/services/donateDate_Services.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Date_Update extends StatefulWidget {
  Date_Update({required this.userId});
  var userId;

  @override
  State<Date_Update> createState() => _Date_UpdateState();
}

class _Date_UpdateState extends State<Date_Update> {
  DonateDateServices _donateDateServices = DonateDateServices();
  DateTime next = DateTime.now();
  Map<String, dynamic> data = {};

  void postDate(String date, String Id, String nextDate) {
    _donateDateServices.postDonateDate(
        context: context,
        donateDate: date,
        userId: Id,
        nextDonateDate: nextDate);
  }

  void update(String date, String Id, String nextDate) {
    _donateDateServices.updateDonateDate(
      context: context,
      donateDate: date,
      userId: Id,
      nextDonateDate: nextDate,
    );
    setState(() {
      initState();
    });
  }

  @override
  void initState() {
    super.initState();
    getUpdatedate();
  }

  void getUpdatedate() {
    _donateDateServices
        .getDonateDate(
      context: context,
      userId: widget.userId,
    )
        .then((result) {
      setState(() {
        if (result == null) {
          postDate("20022/02/02", widget.userId, "2022/02/02");
        } else {
          data = result;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userModel;
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
                  "${data["donateDate"]}",
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
                                      Text("${data["nextDonateDate"]}",
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
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.lightGreen,
                                            ),
                                            child: Text("Notify Me"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // if ("${data}['userId']" == null) {
                                              //   postDate(
                                              //       next.toString(),
                                              //       user.id,
                                              //       _NewDate.toString());
                                              // } else {
                                              update(next.toString(), user.id,
                                                  _NewDate.toString());
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              setState(() {});
                                              // }
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
                  "${data["nextDonateDate"]}",
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
