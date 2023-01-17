import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'msg.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.35,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomDropdownButton2(
                        hint: "Blood Group",
                        buttonDecoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            width: 2,
                            color: Color(0xfff70010),
                          ),
                        ),
                        value: selectedValue,
                        dropdownItems: bloods,
                        buttonHeight: height * 0.06,
                        buttonWidth: height * 0.4,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Color(0xfff70010),
                          ),
                        ),
                        onChanged: ((value) {
                          setState(() {
                            selectedValue = value;
                          });
                        }),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.06,
                        width: width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              labelText: "Plasma",
                              hintText: "Plasma"),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
                        width: width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              labelText: "Platelets",
                              hintText: "Platelets"),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
                        width: width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              labelText: "Pint Amount",
                              hintText: "Pint Amount"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Msg()),
                          );
                        },
                        child: Image.asset(
                          "assets/Update.png",
                          width: width * 0.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
