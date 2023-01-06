import 'package:flutter/material.dart';

import 'notification.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Color(0xffF70010),
            Colors.white,
          ],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () => NotificationApi.showNotification(
                    title: 'Emergency',
                    body: 'Somebody near you need HELP Donate Blood Save Life',
                    payload: 'Help.abs'),
                child: Image.asset('asset/postBotton.png')),
          ],
        ),
      ),
    );
  }
}
