// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product_io/components/rounded_button.dart';
import 'package:product_io/services/firebase_service.dart';
import 'package:product_io/views/auth/login_screen.dart';
import 'package:product_io/views/auth/otp.dart';
import 'package:product_io/views/customer/customer_home.dart';

import '../../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String mobileNumber = "";
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String args = arguments['args'];

    return args != ""
        ? Scaffold(
            backgroundColor: Colors.white,
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 38.0,
                      ),
                      Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (args == "customer") ...[
                        Text("as new customer",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1)
                      ] else ...[
                        Text("as Store Manager",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1)
                      ],
                      SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          mobileNumber = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'eg. +91 987...',
                            labelText: 'Mobile Number'),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          // pwd = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Create New Password',
                            labelText: 'Enter New Password'),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          // pwd = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Confirm Password',
                            labelText: 'Confirm Password'),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                          title: 'Get OTP',
                          colour: kToscaColor,
                          onPress: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              Navigator.pushNamed(context, OtpScreen.id,
                                  arguments: {
                                    "user": args,
                                    "number": mobileNumber
                                  });
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          }),
                      SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: kGreyColor1,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.pushNamed(context, LoginScreen.id),
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: kToscaColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28),
                      Text(
                        "OR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kGreyColor1,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 18),
                      GestureDetector(
                          child: SvgPicture.asset(
                            "assets/images/google.svg",
                            height: 40,
                            color: kToscaColor,
                          ),
                          onTap: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            FirebaseService service = new FirebaseService();
                            try {
                              await service.signInwithGoogle();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, CustomerHome.id, (route) => false);
                            } catch (e) {
                              if (e is FirebaseAuthException) {
                                print(e.message!);
                              }
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          }),
                      SizedBox(height: 8),
                      Text(
                        'By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : Text("Error");
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(12),
        height: 40,
        width: 40,
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}
