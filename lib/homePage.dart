import 'package:blood_sanchaya/Bank_Login.dart';
import 'package:blood_sanchaya/Events.dart';
import 'package:blood_sanchaya/Providers/userProvider.dart';
import 'package:blood_sanchaya/Support.dart';
import 'package:blood_sanchaya/aboutUs.dart';
import 'package:blood_sanchaya/about_Blood_Sanchaya.dart';
import 'package:blood_sanchaya/blood_bank_detail.dart';
import 'package:blood_sanchaya/date_update.dart';
import 'package:blood_sanchaya/feedback.dart';
import 'package:blood_sanchaya/google_map.dart';
import 'package:blood_sanchaya/services/auth_Services.dart';
import 'package:blood_sanchaya/services/districtandBank_Services.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size, height, width;

  void SignOutUser(BuildContext context) {
    AuthServices().signOut(context);
  }

  @override
  final DistrictAndBankServices districtAndBankServices =
      DistrictAndBankServices();

  List<String> districts = [];
  String? selectedDistrict;

  List<String> municipalities = [];
  String? selectedMunicipalities;

  List<String> bloodBankName = [];
  String? selectedBloodBankName;
  void initState() {
    super.initState();
    fetchDistricts();
  }

  void fetchDistricts() async {
    final List<String> fetchedDistricts =
        await districtAndBankServices.getDistricts(context: context);

    setState(() {
      districts = fetchedDistricts;
    });
  }

  void fetchMunicipality(String district) async {
    final List<String> fetchedMunicipalities =
        await districtAndBankServices.getMunicipality(
      context: context,
      districtName: district,
    );
    setState(() {
      municipalities = fetchedMunicipalities;
    });
  }

  void fetchBloodBankName(String district, String municipality) async {
    final List<String> fetchBloodBankName =
        await districtAndBankServices.getBlooodBankName(
      context: context,
      districtName: district,
      municipalityName: municipality,
    );
    setState(() {
      bloodBankName = fetchBloodBankName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).userModel;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          title: Row(
            children: [
              // SizedBox(
              //   width: 0.01 * width,
              // ),
              Image.asset(
                "assets/Drop.png",
                width: height * 0.03,
              ),
              SizedBox(
                width: 0.1 * width,
              ),
              Text(
                "Keep Donating Blood",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.red[300]),
                accountName: Text(
                  "${user.name}",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail:
                    Text(user.email, style: TextStyle(color: Colors.black)),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/Logo.png",
                          ))),
                ),
              ),
              ListTile(
                leading: Icon(Icons.update),
                title: Text("Update Donate Date"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Date_Update(userId: user.id)),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.manage_accounts_sharp),
                title: Text("Manage Event"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Event()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback_rounded),
                title: Text("FeedBack"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Feed_Back()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.shield),
                title: Text("Terms & Condition"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.handshake_outlined),
                title: Text("Support Us"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportUs()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.details_outlined),
                title: Text("About Blood Sanchaya"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => About_Blood_Sanchaya()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.details),
                title: Text("About Developers"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About_Us()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.login,
                  color: Colors.black45,
                ),
                title: Text(
                  "Login As Blood Bank",
                  style: TextStyle(color: Color(0xffEA5959)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bank_Login()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_sharp,
                  color: Colors.red,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(color: Color(0xffEA5959)),
                ),
                onTap: () {
                  SignOutUser(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Search Blood",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.35,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomDropdownButton2(
                        hint: "District",
                        buttonDecoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            width: 2,
                            color: Color(0xfff70010),
                          ),
                        ),
                        value: selectedDistrict,
                        dropdownItems: districts,
                        buttonHeight: height * 0.06,
                        buttonWidth: height * 0.4,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Color(0xfff70010),
                          ),
                        ),
                        onChanged: ((value) {
                          setState(() {
                            selectedDistrict = value;
                            if (selectedDistrict.toString() != null) {
                              fetchMunicipality(selectedDistrict.toString());
                            }
                          });
                        }),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomDropdownButton2(
                        hint: "Municipality",
                        buttonDecoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            width: 2,
                            color: Color(0xfff70010),
                          ),
                        ),
                        value: selectedMunicipalities,
                        dropdownItems: municipalities,
                        buttonHeight: height * 0.06,
                        buttonWidth: height * 0.4,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Color(0xfff70010),
                          ),
                        ),
                        onChanged: ((value) {
                          setState(() {
                            selectedMunicipalities = value;
                            if (selectedDistrict.toString() != null &&
                                selectedMunicipalities.toString() != null) {
                              fetchBloodBankName(selectedDistrict.toString(),
                                  selectedMunicipalities.toString());
                            } else
                              showSnackbar(context, "Khalki xa");
                          });
                        }),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomDropdownButton2(
                        hint: "Blood Bank",
                        dropdownWidth: 0.8 * width,
                        buttonDecoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            width: 2,
                            color: Color(0xfff70010),
                          ),
                        ),
                        value: selectedBloodBankName,
                        dropdownItems: bloodBankName,
                        buttonHeight: height * 0.06,
                        buttonWidth: height * 0.4,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Color(0xfff70010),
                          ),
                        ),
                        onChanged: ((value) {
                          setState(() {
                            selectedBloodBankName = value;
                          });
                        }),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (selectedDistrict.toString() == null) {
                            showSnackbar(context,
                                "Select District ");
                          } else if (selectedMunicipalities.toString() == null) {
                            showSnackbar(context,
                                "Select  Municipality");
                          }else if(selectedBloodBankName.toString()==null)
                          {
                            showSnackbar(context,
                                "Select BloodBank");
                          }else{ Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BB_details(
                                  district: selectedDistrict.toString(),
                                  municipality:
                                      selectedMunicipalities.toString(),
                                  bb_Name: selectedBloodBankName.toString(),
                                ),
                              ),
                            );}
                        },
                        child: Image.asset(
                          "assets/Search.png",
                          width: width * 0.45,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.016,
                ),
                GestureDetector(
                  child: Container(
                    color: Colors.red,
                    height: height * 0.38,
                    child: Google_map(userId: user.id),
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
