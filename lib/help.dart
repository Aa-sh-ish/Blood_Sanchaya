import 'package:blood_sanchaya/msg.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'notification.dart';

class Help extends StatefulWidget {
  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
  void initState() async {
    super.initState();

    NotificationApi.init();
    ListenNotifications();
  }

  void ListenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Msg(),
      ));
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Color(0xffF70010),
            Colors.white,
          ],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
      ),
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
                Text(
                  "Emergency",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.35,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomDropdownButton2(
                      hint: "District",
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
                    CustomDropdownButton2(
                      hint: "Municipality",
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
                            labelText: "Pint Amount",
                            hintText: "Pint Amount"),
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
                            labelText: "Phone Number",
                            hintText: "Phone Number"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => NotificationApi.showNotification(
                          title: 'Emergency',
                          body:
                              'Somebody near you need HELP #Donate Blood Save Life',
                          payload: 'Help.abs'),
                      child: Image.asset('asset/postBotton.png'),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NormalTextField extends StatelessWidget {
  NormalTextField(this.hintText, this.icon, this.labelText);
  var hintText;
  var icon;
  // var controller;
  var labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
