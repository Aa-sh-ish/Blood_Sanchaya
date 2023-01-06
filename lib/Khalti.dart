import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  TextEditingController phnumber_controller = TextEditingController();
  TextEditingController pin_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Image.asset(
                  "assets/Khalti.png",
                  width: screenwidth * 0.4,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Khalti_Button(
                  hint_text: "Enter Phone Number",
                  prefix_icon: Icons.phone,
                  obsecure: false,
                  controller: phnumber_controller,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Khalti_Button(
                    controller: pin_controller,
                    hint_text: "Enter MPIN",
                    prefix_icon: Icons.lock,
                    obsecure: true,
                    suffix_icon: Icons.visibility),
                GestureDetector(
                  onTap: () async {
                    final initiationModel =
                        await Khalti.service.initiatePayment(
                      request: PaymentInitiationRequestModel(
                          amount: 1000,
                          mobile: phnumber_controller.text,
                          productIdentity: "P_id",
                          productName: "Donation",
                          transactionPin: pin_controller.text),
                    );

                    final _OTP = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        String? _otp;
                        return SimpleDialog(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Text("Enter Your OTP"),
                                    TextFormField(
                                      decoration:
                                          InputDecoration(hintText: "OTP"),
                                      onChanged: ((value) {
                                        _otp = value;
                                      }),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context, _otp);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xff59226A),
                                      ),
                                      child: Text("Pay"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    if (_OTP != null) {
                      try {
                        final model = await Khalti.service.confirmPayment(
                          request: PaymentConfirmationRequestModel(
                              confirmationCode: _OTP,
                              token: initiationModel.token,
                              transactionPin: pin_controller.text),
                        );

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Payment Suscessful"),
                                content:
                                    Text("Verification Code : ${model.token}"),
                              );
                            });
                      } catch (e) {
                        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                          ),
                        );
                      }
                    }
                  },
                  child: Image.asset(
                    "assets/Donate.png",
                    width: screenwidth * 0.5,
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

class Khalti_Button extends StatefulWidget {
  Khalti_Button(
      {required this.hint_text,
      required this.prefix_icon,
      required this.controller,
      this.suffix_icon,
      this.obsecure});

  var hint_text;
  var prefix_icon;
  var suffix_icon;
  var obsecure;
  var controller;
  @override
  State<Khalti_Button> createState() => _Khalti_ButtonState();
}

class _Khalti_ButtonState extends State<Khalti_Button> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obsecure,
      decoration: InputDecoration(
        fillColor: Colors.white70,
        filled: true,
        hintText: widget.hint_text,
        prefixIcon: Icon(
          widget.prefix_icon,
          color: Colors.black45,
        ),
        suffix: InkWell(
          onTap: () {
            setState(() {
              widget.obsecure = !widget.obsecure;
            });
          },
          child: Icon(
            widget.obsecure ? widget.suffix_icon : Icons.visibility_off,
            color: Colors.black45,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: Color(0xff59226A),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: Color(0xff59226A),
            width: 2,
          ),
        ),
      ),
    );
  }
}
