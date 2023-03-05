// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blood_sanchaya/Providers/userProvider.dart';
import 'package:blood_sanchaya/services/BloodStatus_Services.dart';
import 'package:blood_sanchaya/services/bankNoti.dart';
import 'package:blood_sanchaya/services/districtandBank_Services.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BB_details extends StatefulWidget {
  final String district;
  final String municipality;
  final String bb_Name;
  const BB_details({
    required this.district,
    required this.municipality,
    required this.bb_Name,
  });

  @override
  State<BB_details> createState() => _BB_detailsState();
}

class _BB_detailsState extends State<BB_details> {
  TextEditingController bloodBookController = TextEditingController();

  Map<String, dynamic> data = {};
  Map<String, dynamic> status = {};
  final List<String> bloods = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
  ];

  DistrictAndBankServices _districtAndBankServices = DistrictAndBankServices();
  //BloodStatusServises _bloodStatusServises = BloodStatusServises();
  late Map<String, dynamic> _bloodBankDetails = {};
  bool _isLoading = true;

  void initState() {
    super.initState();
    _getBloodBankDetails();
    getbankDetails();
  }

  void getbankDetails() {
    _districtAndBankServices
        .getBloodBankDetails(
      context: context,
      districtName: widget.district,
      municipalityName: widget.municipality,
      bankName: widget.bb_Name,
    )
        .then((results) {
      setState(() {
        data = results;
      });
    });
  }

  void _getBloodBankDetails() async {
    try {
      final bloodBankService = BloodStatusServises();
      _bloodBankDetails =
          await bloodBankService.getBloodBankDetails(widget.bb_Name);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  void bookBlood(
      String name, String bloodGroup, String amount, String phoneNumber) {
    BankNotificationServices().BankNotiPost(
      context: context,
      bankName: widget.bb_Name,
      name: name,
      bloodGroup: bloodGroup,
      amount: amount,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userModel;
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
          backgroundColor: Color(0x000000),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data['bankName']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("${data['location']}"),
                          Row(
                            children: [
                              InkWell(
                                onTap: (() {
                                  callNumber("${data['ph_number']}");
                                }),
                                child: Icon(
                                  Icons.call,
                                  color: Color(0xffFE0011),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("${data['ph_number']}"),
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
                              Text("${data['email']}"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Available Bloods",
                    style: TextStyle(
                        color: Color(0xfff70010), fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Color(0xfff6e6e6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Status On ${_bloodBankDetails['updatedAt']}",
                                        style: TextStyle(
                                          color: Colors.lightGreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  color: Color(0xffE9E8EA),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Teext(text: "Blood Group"),
                                      Teext(text: "Available"),
                                    ],
                                  ),
                                ),
                              ),
                              ListView.builder(
                                itemCount: 8,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (() {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                "BookBlood  ${bloods[index]}",
                                                style: TextStyle(
                                                  color: Color(0xffEA5959),
                                                ),
                                              ),
                                              content: TextField(
                                                controller: bloodBookController,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    hintText: "Enter Amount"),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                    onPressed: () {
                                                      if (bloodBookController
                                                              .text ==
                                                          null) {
                                                        showSnackbar(context,
                                                            "Enter amount");
                                                      } else {
                                                        
                                                            bookBlood(
                                                            user.name,
                                                            " ${bloods[index]}",
                                                            bloodBookController
                                                                .text,
                                                            user.phoneNumber);
                                                      }
                                                    },
                                                    child: Text(
                                                      "Book Blood",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .lightGreen),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xffEA5959)),
                                                    ))
                                              ],
                                            );
                                          });
                                    }),
                                    child: Container(
                                      width: screenwidth * 0.8,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Teext(text: bloods[index]),
                                                Teext(
                                                    text:
                                                        "${_bloodBankDetails['${bloods[index]}']}"),
                                              ],
                                            ),
                                            const Divider(
                                              height: 20,
                                              thickness: 2,
                                              indent: 20,
                                              endIndent: 0,
                                              color: Colors.black,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Teext extends StatelessWidget {
  Teext({required this.text});
  var text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
