import 'package:blood_sanchaya/Providers/notification.Provider.dart';
import 'package:blood_sanchaya/services/notification_Services.dart';
import 'package:blood_sanchaya/signin.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:provider/provider.dart';

import 'Providers/userProvider.dart';

class Help_Post extends StatefulWidget {
  const Help_Post({super.key});

  @override
  State<Help_Post> createState() => _Help_PostState();
}

class _Help_PostState extends State<Help_Post> {
  final List<String> bloods = [
    "A+",
    "A-",
  ];
  TextEditingController pint_Controller = TextEditingController();
  TextEditingController Ph_Controller = TextEditingController();
  String? muniValue;
  String? distValue;
  String? bloodGroupValue;

  @override
  void initState() {
    super.initState();
    notificationApi.initialiseNotifications();
  }

  NotificationApi notificationApi = NotificationApi();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userModel;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    void postNotification() async {
      NotificationServices().postNotification(
          context: context,
          name: user.name.toString(),
          district: distValue.toString(),
          municipality: muniValue.toString(),
          bloodGroup: bloodGroupValue.toString(),
          bloodPint: pint_Controller.text,
          phoneNumber: Ph_Controller.text);
    }

    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Color(0xffEA5959),
            Color(0xffF5F5F5),
          ],
          begin: FractionalOffset.topRight,
          end: FractionalOffset.bottomLeft,
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(" HelpPost"),
                SizedBox(
                  height: screenHeight * 0.02,
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
                  value: distValue,
                  dropdownItems: bloods,
                  buttonHeight: screenHeight * 0.06,
                  buttonWidth: screenHeight * 0.4,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Color(0xfff70010),
                    ),
                  ),
                  onChanged: ((value) {
                    setState(() {
                      distValue = value;
                    });
                  }),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
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
                  value: muniValue,
                  dropdownItems: bloods,
                  buttonHeight: screenHeight * 0.06,
                  buttonWidth: screenHeight * 0.4,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Color(0xfff70010),
                    ),
                  ),
                  onChanged: ((value) {
                    setState(() {
                      muniValue = value;
                    });
                  }),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                CustomDropdownButton2(
                  hint: "blood Group",
                  buttonDecoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      width: 2,
                      color: Color(0xfff70010),
                    ),
                  ),
                  value: bloodGroupValue,
                  dropdownItems: bloods,
                  buttonHeight: screenHeight * 0.06,
                  buttonWidth: screenHeight * 0.4,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Color(0xfff70010),
                    ),
                  ),
                  onChanged: ((value) {
                    setState(() {
                      bloodGroupValue = value;
                    });
                  }),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                All_Button(
                  hint_text: "Blood Pint",
                  prefix_icon: Icons.water_drop_rounded,
                  controller: pint_Controller,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                All_Button(
                  hint_text: "Phone Number",
                  prefix_icon: Icons.phone,
                  controller: Ph_Controller,
                ),
                GestureDetector(
                  onTap: () async {
                    if (pint_Controller == null ||
                        Ph_Controller == null ||
                        muniValue == null ||
                        distValue == null ||
                        bloodGroupValue == null) {
                      showSnackbar(context, "Value Required");
                    } else {
                      postNotification();
                      NotificationApi().sendNotification("Emergency",
                          "${bloodGroupValue} is needed in ${distValue}");
                    }
                  },
                  child: Image.asset(
                    "assets/Post.png",
                    height: screenwidth * 0.2,
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
