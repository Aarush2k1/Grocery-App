// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_io/components/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _auth = FirebaseAuth.instance;
  // String email;
  // String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 28.0,
              ),
              Text(
                'LOGIN',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'eg. +91 987...', labelText: 'Mobile Number'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Enter Password or login using OTP",
                textAlign: TextAlign.center,
                style: TextStyle(color: kGreyColor1),
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  // password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Password', labelText: 'Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'LOGIN',
                colour: kToscaColor,
                onPress: () async {
                  print('Logged in');
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16, color: kToscaColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
