import 'package:blood_sanchaya/blood_bank_detail.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
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
          backgroundColor: Color(0x000000),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/Logo.png",
                    height: screenwidth * 0.3,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Blood",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff70010),
                        ),
                        children: [
                          TextSpan(
                            text: "   सन्चय",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Text(
                    "Create Your Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  All_Button(
                    hint_text: "Enter Your Mail",
                    prefix_icon: Icons.mail,
                    obsecure: false,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Pass_Button(
                    hint_text: "Enter Your Password",
                    prefix_icon: Icons.lock_outline,
                    suffix_icon: Icons.remove_red_eye_outlined,
                    obsecure: true,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Pass_Button(
                    hint_text: "Re-enter Your Password ",
                    prefix_icon: Icons.lock_outline,
                    suffix_icon: Icons.remove_red_eye_outlined,
                    obsecure: true,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  All_Button(
                    hint_text: "Phone Number",
                    prefix_icon: Icons.phone,
                    obsecure: false,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomDropdownButton2(
                          hint: "Address",
                          buttonDecoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          value: selectedValue,
                          dropdownItems: bloods,
                          buttonHeight: screenHeight * 0.06,
                          buttonWidth: screenwidth * 0.4,
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
                          hint: "Blood Group",
                          buttonDecoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(24)),
                          value: selectedValue,
                          dropdownItems: bloods,
                          buttonHeight: screenHeight * 0.06,
                          buttonWidth: screenwidth * 0.4,
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
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: screenHeight * 0.02,
                  // ),
                  GestureDetector(
                    child: Image.asset(
                      "assets/SignIn Button.png",
                      width: screenHeight * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Text(
                      "Already Have An Account",
                      style: TextStyle(
                          color: Color(0xfff70010),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Pass_Button extends StatefulWidget {
  Pass_Button(
      {required this.hint_text,
      required this.prefix_icon,
      this.suffix_icon,
      this.obsecure});

  var hint_text;
  var prefix_icon;
  var suffix_icon;
  var obsecure;
  @override
  State<Pass_Button> createState() => _Pass_ButtonState();
}

class _Pass_ButtonState extends State<Pass_Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: widget.obsecure,
        decoration: InputDecoration(
          fillColor: Colors.white70,
          filled: true,
          hintText: widget.hint_text,
          prefixIcon: Icon(
            widget.prefix_icon,
            color: Colors.black45,
          ),
          suffix: InkWell(
            onTap: () {
              setState(() {
                widget.obsecure = !widget.obsecure;
              });
            },
            child: Icon(
              widget.obsecure ? Icons.visibility : Icons.visibility_off,
              color: Colors.black45,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Colors.white70,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Color(0xffFE0011),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class All_Button extends StatefulWidget {
  All_Button(
      {required this.hint_text, required this.prefix_icon, this.obsecure});

  var hint_text;
  var prefix_icon;
  var obsecure;
  @override
  State<All_Button> createState() => _All_ButtonState();
}

class _All_ButtonState extends State<All_Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          fillColor: Colors.white70,
          filled: true,
          hintText: widget.hint_text,
          prefixIcon: Icon(
            widget.prefix_icon,
            color: Colors.black45,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Colors.white70,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Color(0xffFE0011),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
