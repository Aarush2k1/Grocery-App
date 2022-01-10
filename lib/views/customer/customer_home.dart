// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/views/auth/registration_screen.dart';
import 'package:product_io/components/app_drawer.dart';
import 'package:product_io/views/customer/components/categories.dart';
import 'package:product_io/views/customer/components/popular_groceries.dart';
import 'package:product_io/views/customer/components/cart_icon.dart';
import 'package:product_io/views/customer/components/popular_stores.dart';

class CustomerHome extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  ScrollController _scrollController = ScrollController();
  static const String id = "customer";

  @override
  Widget build(BuildContext context) {
    return user != null
        ? Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: kWhiteColor),
              backgroundColor: kOrangeColor,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "Bathinda, Punjab",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 16,
                      ),
                      onTap: () {
                        print("pressed Location");
                      },
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                CartIcon(),
              ],
            ),
            drawer: Drawer(
              child: AppDrawer(
                screen: "customer",
              ),
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 14),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: kGreyColor5,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (value) => print(value),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: (20), vertical: (12)),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search groceries, stores, categories...",
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    Categories(),
                    PopularGroceries(),
                    SizedBox(height: 8),
                    PopularStores(),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: kOrangeColor,
              isExtended: true,
              child: Icon(
                Icons.arrow_upward_rounded,
                color: kSecondaryOrangeColor,
              ),
              onPressed: () {
                if (_scrollController.hasClients) {
                  final position = _scrollController.position.minScrollExtent;
                  _scrollController.animateTo(position,
                      duration: Duration(seconds: 3), curve: Curves.easeOut);
                  _scrollController.jumpTo(position);
                }
              },
            ),
          )
        : RegistrationScreen();
  }
}
