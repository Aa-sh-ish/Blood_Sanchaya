import 'package:flutter/material.dart';

class BB_details extends StatefulWidget {
  const BB_details({super.key});

  @override
  State<BB_details> createState() => _BB_detailsState();
}

class _BB_detailsState extends State<BB_details> {
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
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Blood Bank XYZ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Bharatpur-11,Chitwan"),
                        Text("Bharatpur Hospital"),
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Color(0xffFE0011),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("01-111111"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Color(0xffFE0011),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("xyz@gmail.com"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
