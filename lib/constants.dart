import 'package:flutter/material.dart';

const kWhiteColor = Color(0xffFFFFFF);
const kBlackColor = Color(0xff000000);

// Primary Colors
const kPrimaryColor = Color(0xff54B175);
const kOrangeColor = Color(0xffFE6E4C);
const kYellowColor = Color(0xffFEBF43);
const kPurpleColor = Color(0xff9B81E5);
const kToscaColor = Color(0xff03B0A9);

const kSecondaryColor = Color(0xffE4F3EA);
const kSecondaryOrangeColor = Color(0xffFFECE8);
const kSecondaryYellowColor = Color(0xffFFF6E4);
const kSecondaryPurpleColor = Color(0xffF1EDFC);
const kSecondaryToscaColor = Color(0xffDDF5F4);

// Labels Color
const kPrimaryLabelColor = Color(0xff22292E);
const kSecondaryLabelColor = Color(0xff8A8A8E);
const kTertiaryLabelColor = Color(0xffC5C5C7);
const kQuarternaryLabelColor = Color(0xffF8F8F8);

const kGreyColor1 = Color(0xff8E8E93);
const kGreyColor2 = Color(0xffAEAEB2);
const kGreyColor3 = Color(0xffC7C7CC);
const kGreyColor4 = Color(0xffD1D1D6);
const kGreyColor5 = Color(0xffE5E5EA);
const kGreyColor6 = Color(0xffF2F2F7);

const kTextFieldDecoration = InputDecoration(
  labelText: 'Label',
  hintText: 'text',
  labelStyle: TextStyle(color: Color(0xff172E4F)),
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryLabelColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryLabelColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
