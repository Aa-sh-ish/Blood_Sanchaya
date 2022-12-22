import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  var  size,height,width;

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
              )
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text("Log in Your Account",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
         SizedBox(
           height: height*0.02,
         ),

         Padding(
           padding:EdgeInsets.symmetric(horizontal: 30.0),
           child: TextField(
             decoration: InputDecoration(
               filled: true,
               fillColor: Colors.white70,
               border: OutlineInputBorder(

                 borderRadius: BorderRadius.circular(20.0),
               ),
               prefixIcon: Icon(
                 Icons.email,
                 color: Colors.black,
                 size: 30,
               ),
               hintText: "Email",
               hintStyle: TextStyle(fontSize: 16),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(20),
                 borderSide: BorderSide(
                   color: Colors.white70,
                   width: 0.1
                 ),
             ),

           ),
         ),
         ),
          SizedBox(
            height: height*0.02,
          ),

          Padding(
           padding:EdgeInsets.symmetric(horizontal: 30.0),
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
                 borderSide: BorderSide(
                     color: Colors.white70,
                     width: 0.1
                 ),
               ),
               prefixIcon: Icon(
                 Icons.lock,
                 color: Colors.black,
               size: 30,),
               suffix: InkWell(

                 onTap: _togglePasswordView,
                 child: Icon(
                   size:15,
                   _isHidden
                       ? Icons.visibility
                       : Icons.visibility_off,
                 ),
               ),
             ),
             ),
           ),
          SizedBox(
            height: height*0.02,
          ),
          GestureDetector(child: Image.asset("assets/login in button.png",width: height*0.3)),

          SizedBox(
            height: height*0.02,
          ),

          TextButton(
            child: Text('Don’t have an Account',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            style: TextButton.styleFrom(
              primary: Color(0xffC51111),
            ),
            onPressed: () {
              print('Pressed');
            },
          ),

          SizedBox(
            height: height*0.02,
          ),
          TextButton(
            child: Text('Forgot Password ',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            style: TextButton.styleFrom(
              primary: Color(0xffC51111),
            ),
            onPressed: () {
              print('Pressed');
            },
          ),

        ],
      )),
    );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}




