// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/views/auth/otp_form.dart';

class OtpScreen extends StatelessWidget {
  static String id = 'otp';
  OtpScreen({Key? key}) : super(key: key);
  String mobileNo = "";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String user = arguments['user'];
    mobileNo = arguments['number'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OTP Verification',
          style: TextStyle(color: kToscaColor),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 28,
                ),
                Text(
                  "Code sent to +91 ${mobileNo}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Code will expire in "),
                    TweenAnimationBuilder(
                      tween: Tween(begin: 60.0, end: 0.0),
                      duration: Duration(minutes: 1),
                      builder: (_, dynamic value, child) =>
                          Text("00:${value.toInt()}"),
                    )
                  ],
                ),
                OTPform(
                  user: user,
                ),
                SizedBox(height: 28),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline),
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
