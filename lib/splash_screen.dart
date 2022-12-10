import 'package:blood_sanchaya/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
   var screenWidth= MediaQuery.of(context).size.width;
   var screenHeight=MediaQuery.of(context).size.height;
    return Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Color(0xffF70010),
                Colors.white,
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
          )
      ),
      child: EasySplashScreen(logo: Image.asset("assets/Logo.png",scale: 2,),
        title: Text(
          "Blood   सन्चय",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),
        ),
        showLoader: true,
        durationInSeconds: 3,
        navigator: LoginPage(),

      ),
    );
  }
}



