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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0x000000),
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    height: screenHeight * 0.2,
                    child: Column(
                      children: [Text("dsfsfd")],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
