import 'package:blood_sanchaya/services/bankNoti.dart';
import 'package:flutter/material.dart';

class Bank_Notification extends StatefulWidget {
  Bank_Notification({required this.bankName});
  String bankName;
  @override
  State<Bank_Notification> createState() => _Bank_NotificationState();
}

class _Bank_NotificationState extends State<Bank_Notification> {



@override
  List<dynamic> data = [];
  void initState() {
    super.initState();
    BankNotificationServices()
        .getBankNotification(context: context, bankName: widget.bankName)
        .then((result) {
      data = result;
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
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Post(
                            amount: item['amount'],
                            users: item['name'],
                            bloodGroup: item['bloodgroup'],
                            ph_Number: item['Phone'],
                            screenwidth: screenwidth),
                        SizedBox(
                          height: 20,
                        )
                      ],
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

class Post extends StatefulWidget {
  const Post({
    Key? key,
    required this.amount,
    required this.users,
    required this.bloodGroup,
    required this.ph_Number,
    required this.screenwidth,
  }) : super(key: key);
  final String amount;
  final String users;
  final String bloodGroup;
  final String ph_Number;
  final double screenwidth;

  @override
  State<Post> createState() => _PostState();



}

class _PostState extends State<Post> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "${widget.users} need ${widget.amount} pint of ${widget.bloodGroup}  contact detail:${widget.ph_Number}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Provided",
                    style: TextStyle(color: Colors.lightGreen),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
