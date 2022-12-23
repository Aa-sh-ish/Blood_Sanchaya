import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
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
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Image.asset(
                    "assets/Logo.png",
                    height: width * 0.3,
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
                    height: height * 0.03,
                  ),
                  Text(
                    "Log in Your Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black45,
                          size: 30,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 16),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color(0xfff70010), width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 16),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color(0xfff70010), width: 2),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black45,
                          size: 30,
                        ),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              _isHidden = !_isHidden;
                            });
                          },
                          child: Icon(
                            size: 15,
                            _isHidden ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      child: Image.asset("assets/login in button.png",
                          width: height * 0.2)),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextButton(
                    child: Text('Don’t have an Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    style: TextButton.styleFrom(
                      primary: Color(0xfff70010),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextButton(
                    child: Text('Forgot Password ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    style: TextButton.styleFrom(
                      primary: Color(0xfff70010),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
