import 'package:blood_sanchaya/Providers/notification.Provider.dart';
import 'package:blood_sanchaya/services/notification_Services.dart';
import 'package:flutter/material.dart';

class Event_and_Help extends StatefulWidget {
  @override
  State<Event_and_Help> createState() => _Event_and_HelpState();
}

class _Event_and_HelpState extends State<Event_and_Help> {
  List<dynamic> data = [];
  void initState() {
    super.initState();
    
    NotificationServices().getNotification(context: context).then((results) {
      setState(() {
        data = results;
      });
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
              "Keep Donating Blood",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Color(0x000000),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    final item = data[index];
                    return Post(
                      users: item['name'],
                      municipality: item['municipality'],
                      district: item['disrict'],
                      bloodGroup: item['bloodGroup'].toString(),
                      ph_Number: item['phoneNumber'].toString(),
                      screenwidth: screenwidth,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.users,
    required this.municipality,
    required this.district,
    required this.bloodGroup,
    required this.ph_Number,
    required this.screenwidth,
  }) : super(key: key);

  final String users;
  final String municipality;
  final String district;
  final String bloodGroup;
  final String ph_Number;
  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, bottom: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "${users} from ${municipality} , ${district} needs ${bloodGroup}blood please contact ${users} in ${ph_Number} ThankYou!!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/Cancel.png",
                    width: screenwidth * 0.3,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/Call.png",
                      width: screenwidth * 0.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
