import 'package:blood_sanchaya/bloodBookNotification.dart';
import 'package:blood_sanchaya/services/BloodStatus_Services.dart';
import 'package:flutter/material.dart';

class Blood_Banks extends StatefulWidget {
  Blood_Banks({required this.bbName});
  String bbName;

  @override
  State<Blood_Banks> createState() => _Blood_BanksState();
}

class _Blood_BanksState extends State<Blood_Banks> {
  TextEditingController A_Positive_Controller = TextEditingController();
  TextEditingController A_Negative_Controller = TextEditingController();
  TextEditingController B_Positive_Controller = TextEditingController();
  TextEditingController B_Negative_Controller = TextEditingController();
  TextEditingController AB_Positive_Controller = TextEditingController();
  TextEditingController AB_Negative_Controller = TextEditingController();
  TextEditingController O_Positive_Controller = TextEditingController();
  TextEditingController O_Negative_Controller = TextEditingController();
  int oneId = 0;
  void postStatus() {
    BloodStatusServises().postBloodStatus(
        context: context,
        bankName: widget.bbName,
        A_P: A_Positive_Controller.text,
        A_N: A_Negative_Controller.text,
        B_P: B_Positive_Controller.text,
        B_N: B_Negative_Controller.text,
        AB_P: AB_Positive_Controller.text,
        AB_N: AB_Negative_Controller.text,
        O_P: O_Positive_Controller.text,
        O_N: O_Negative_Controller.text);
  }

  void updateStatus() {
    BloodStatusServises().updateBloodStatus(
        context: context,
        bankName: widget.bbName,
        A_P: A_Positive_Controller.text,
        A_N: A_Negative_Controller.text,
        B_P: B_Positive_Controller.text,
        B_N: B_Negative_Controller.text,
        AB_P: AB_Positive_Controller.text,
        AB_N: AB_Negative_Controller.text,
        O_P: O_Positive_Controller.text,
        O_N: O_Negative_Controller.text);
  }

  @override
  void initState() {
    super.initState();
    BloodStatusServises().getOneBankName(context, widget.bbName).then((result) {
      oneId = result;
    });
  }

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
            actions: [IconButton(onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Bank_Notification(bankName: widget.bbName)),
            );
            }, icon: Icon(Icons.notification_important),iconSize:40 ,)],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "A+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                          width: screenwidth * 0.6,
                          child: All_Button_Numer(
                              hint_text: "A+",
                              prefix_icon: Icons.bloodtype,
                              controller: A_Positive_Controller)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "A-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                          width: screenwidth * 0.6,
                          child: All_Button_Numer(
                              hint_text: "A-",
                              prefix_icon: Icons.bloodtype,
                              controller: A_Negative_Controller)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "B+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                          width: screenwidth * 0.6,
                          child: All_Button_Numer(
                              hint_text: "B+",
                              prefix_icon: Icons.bloodtype,
                              controller: B_Positive_Controller)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "B-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                          width: screenwidth * 0.6,
                          child: All_Button_Numer(
                              hint_text: "B-",
                              prefix_icon: Icons.bloodtype,
                              controller: B_Negative_Controller)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AB+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                          width: screenwidth * 0.6,
                          child: All_Button_Numer(
                              hint_text: "AB+",
                              prefix_icon: Icons.bloodtype,
                              controller: AB_Positive_Controller)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AB-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                          width: screenwidth * 0.6,
                          child: All_Button_Numer(
                              hint_text: "AB-",
                              prefix_icon: Icons.bloodtype,
                              controller: AB_Negative_Controller)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "O+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                          width: screenwidth * 0.6,
                          child: All_Button_Numer(
                              hint_text: "O+",
                              prefix_icon: Icons.bloodtype,
                              controller: O_Positive_Controller)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "O-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                          width: screenwidth * 0.6,
                          child: All_Button_Numer(
                              hint_text: "O-",
                              prefix_icon: Icons.bloodtype,
                              controller: O_Negative_Controller)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (oneId != 1234) {
                        updateStatus();
                      } else {
                        postStatus();
                      }
                      });
                    },
                    child: Image.asset(
                      "assets/Post.png",
                      width: screenwidth * 0.4,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class All_Button_Numer extends StatefulWidget {
  All_Button_Numer({
    required this.hint_text,
    required this.prefix_icon,
    required this.controller,
    this.obsecure,
  });

  var hint_text;
  var prefix_icon;
  var obsecure;
  var controller;
  @override
  State<All_Button_Numer> createState() => _All_Button_NumerState();
}

class _All_Button_NumerState extends State<All_Button_Numer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: widget.controller,
        obscureText: false,
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