import 'package:blood_sanchaya/BB.dart';
import 'package:blood_sanchaya/signin.dart';
import 'package:flutter/material.dart';

class Bank_Login extends StatefulWidget {
  const Bank_Login({super.key});

  @override
  State<Bank_Login> createState() => _Bank_LoginState();
}

class _Bank_LoginState extends State<Bank_Login> {
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
              "Login In as a Blood Bank",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Image.asset(
                "assets/Logo.png",
                width: screenwidth * 0.3,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              All_Button(
                hint_text: "Enter Your Bank",
                prefix_icon: Icons.local_hospital_rounded,
                obsecure: true,
                controller: "",
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              All_Button(
                hint_text: "Enter Your Bank Id",
                prefix_icon: Icons.perm_identity_outlined,
                obsecure: true,
                controller: "",
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Pass_Button(
                hint_text: "Enter Your Passcode",
                prefix_icon: Icons.lock,
                obsecure: true,
                suffix_icon: Icons.visibility,
                controller: "",
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Blood_Banks()),
                  );
                },
                child: Image.asset(
                  "assets/login in button.png",
                  width: screenwidth * 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
