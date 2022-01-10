// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/views/customer/customer_home.dart';
import 'package:product_io/views/store/store_home.dart';

class OTPform extends StatefulWidget {
  final String user;
  const OTPform({Key? key, required this.user}) : super(key: key);

  @override
  State<OTPform> createState() => _OTPformState();
}

class _OTPformState extends State<OTPform> {
  late FocusNode pin2;
  late FocusNode pin3;
  late FocusNode pin4;

  @override
  void initState() {
    super.initState();
    pin2 = FocusNode();
    pin3 = FocusNode();
    pin4 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: kGreyColor1),
    );
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    cursorColor: kGreyColor1,
                    autofocus: true,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      focusColor: Colors.grey,
                      border: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      nextField(value, pin2);
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    focusNode: pin2,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      focusColor: Colors.grey,
                      border: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => nextField(value, pin3),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    focusNode: pin3,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      focusColor: Colors.grey,
                      border: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => nextField(value, pin4),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    focusNode: pin4,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      focusColor: Colors.grey,
                      border: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4.unfocus();
                        // Then you need to check is the code is correct or not
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          if (widget.user == "customer") ...[
            MaterialButton(
              child: Text(
                "Continue",
                style: TextStyle(color: kWhiteColor),
              ),
              color: kToscaColor,
              onPressed: () {
                print("pressed customer");
                Navigator.pushNamed(context, CustomerHome.id);
              },
            ),
          ] else ...[
            MaterialButton(
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
              color: kToscaColor,
              onPressed: () {
                Navigator.pushNamed(context, StoreHome.id);
                print("pressed store");
              },
            ),
          ]
        ],
      ),
    );
  }
}
