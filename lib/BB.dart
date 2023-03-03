import 'package:blood_sanchaya/blood_bank_detail.dart';
import 'package:flutter/material.dart';

class Blood_Banks extends StatefulWidget {
  const Blood_Banks({super.key});

  @override
  State<Blood_Banks> createState() => _Blood_BanksState();
}

class _Blood_BanksState extends State<Blood_Banks> {
  
  @override
 // int counter = 0;
  TextEditingController Number_inc_sub_controller = TextEditingController();
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
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    height: screenHeight * 0.04,
                    color: Color(0xffE9E8EA),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Teext(text: "    B_G"),
                        Teext(text: "Status"),
                        Teext(text: "Plasma"),
                        Teext(text: "Platelets"),
                        SizedBox(width: 1)
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "      A+"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "      A-"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "      B+"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "      B-"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "      A+"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "     AB+"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "     AB-"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "      O+"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Teext(text: "      O-"),
                      UpdateField(),
                      UpdateField(),
                      UpdateField(),
                      SizedBox(width: 10)
                    ],
                  ),
                  Image.asset(
                    "assets/Post.png",
                    width: screenwidth * 0.4,
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

class UpdateField extends StatelessWidget {
  @override
  int counter = 0;
  TextEditingController Number_inc_sub_controller = TextEditingController();
  Widget build(BuildContext context) {
   double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth * 0.2,
      height: screenHeight*0.04,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 90,
            child: Padding(
              padding: const EdgeInsets.only(top:2,left: 18,),
              child: TextField(
                
              //  controller: Number_inc_sub_controller,
                decoration: InputDecoration(

                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize:15),
                textAlign: TextAlign.center,
                readOnly: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
