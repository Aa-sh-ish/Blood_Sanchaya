import 'package:blood_sanchaya/signin.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

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
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
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
                Text("Emergency Post"),
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
                  value: selectedValue,
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
                      selectedValue = value;
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
                  value: selectedValue,
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
                      selectedValue = value;
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
                  value: selectedValue,
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
                      selectedValue = value;
                    });
                  }),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                All_Button(
                  hint_text: "Blood Pint",
                  prefix_icon: Icons.water_drop_rounded,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                All_Button(
                  hint_text: "Phone Number",
                  prefix_icon: Icons.phone,
                ),
                Image.asset(
                  "assets/Post.png",
                  height: screenwidth * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
