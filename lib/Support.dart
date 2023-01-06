import 'package:blood_sanchaya/Khalti.dart';
import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';

class SupportUs extends StatefulWidget {
  const SupportUs({super.key});

  @override
  State<SupportUs> createState() => _SupportUsState();
}

class _SupportUsState extends State<SupportUs> {
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
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Help Us Donating Bloods and Organizing Camps",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                "Support Us by:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: (context),
                    barrierDismissible: false,
                    builder: (context) {
                      String? _money;
                      return SimpleDialog(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Text("Enter Amount you want to Support"),
                                  TextFormField(
                                    decoration: InputDecoration(hintText: "Rs"),
                                    onChanged: ((value) {
                                      _money = value;
                                    }),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff59226A),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentMethod()),
                                      );
                                    },
                                    child: Text("Submit"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Image.asset(
                  "assets/Khalti.png",
                  width: screenHeight * 0.3,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
