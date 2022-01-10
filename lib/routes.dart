// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:product_io/views/auth/login_screen.dart';
import 'package:product_io/views/auth/otp.dart';
import 'package:product_io/views/auth/registration_screen.dart';
import 'package:product_io/views/customer/customer_home.dart';
import 'package:product_io/views/on_board.dart';
import 'package:product_io/views/store/store_home.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoard.id: (context) => OnBoard(),
  LoginScreen.id: (context) => LoginScreen(),
  RegistrationScreen.id: (context) => RegistrationScreen(),
  OtpScreen.id: (context) => OtpScreen(),
  CustomerHome.id: (conext) => CustomerHome(),
  StoreHome.id: (context) => StoreHome(),
};
