import 'package:blood_sanchaya/BB.dart';
import 'package:blood_sanchaya/services/admin_Services.dart';
import 'package:blood_sanchaya/services/districtandBank_Services.dart';
import 'package:blood_sanchaya/signin.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

class Bank_Login extends StatefulWidget {
  const Bank_Login({super.key});

  @override
  State<Bank_Login> createState() => _Bank_LoginState();
}

class _Bank_LoginState extends State<Bank_Login> {

final TextEditingController passCode_Controller = TextEditingController();


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

    void loginasBloodBank() {
    BloodBank().LoginBloodBank(
        context: context,
        BankName: selectedBloodBankName.toString(),
        adminPassword: "sec076bct002");
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
              "Login In as a Blood Bank",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Image.asset(
                "assets/Logo.png",
                width: screenwidth * 0.3,
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
                buttonHeight: screenHeight * 0.06,
                buttonWidth: screenHeight * 0.4,
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
                height: screenHeight * 0.02,
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
                buttonHeight: screenHeight * 0.06,
                buttonWidth: screenHeight * 0.4,
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
                      showSnackbar(context, "Ghalti xa");
                  });
                }),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomDropdownButton2(
                hint: "Blood Bank",
                dropdownWidth: 0.8 * screenwidth,
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
                buttonHeight: screenHeight * 0.06,
                buttonWidth: screenHeight * 0.4,
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
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Pass_Button(
                hint_text: "Enter Your Passcode",
                prefix_icon: Icons.lock,
                obsecure: true,
                suffix_icon: Icons.visibility,
                controller: passCode_Controller,
              ),
              GestureDetector(
                onTap: () {
                  loginasBloodBank();
                },
                child: Image.asset(
                  "assets/login in button.png",
                  width: screenwidth * 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
