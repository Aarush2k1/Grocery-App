// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/services/firebase_service.dart';
import 'package:product_io/views/on_board.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({required this.screen});
  String screen;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.difference,
              color: (screen == "customer") ? kOrangeColor : kPurpleColor,
            ),
            accountName: Text(user!.displayName!),
            accountEmail: Text(user!.email!),
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => Account_Screen()));
            // },
          ),
        ),
        screen == "customer"
            ? Card(
                elevation: 4.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text("Favorite Stores"),
                      // onTap: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Item_Screen(
                      //                 toolbarname: name,
                      //               )));
                      // }
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text("Order History "),
                      // onTap: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Oder_History(
                      //                 toolbarname: ' Order History',
                      //               )));
                      // },
                    ),
                  ],
                ),
              )
            : Card(
                elevation: 4.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.stacked_bar_chart),
                      title: Text("Total Sales"),
                      // onTap: () {
                      // }
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text("Marketing"),
                    ),
                  ],
                ),
              ),
        // Settings/ Help
        Card(
          elevation: 4.0,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => Setting_Screen(
                //                 toolbarname: 'Setting',
                //               )));
                // },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Help"),
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Help_Screen(
                //         toolbarname: 'Help',
                //       ),
                //     ),
                //   );
                // },),
              ),
            ],
          ),
        ),
        //  Logout
        Card(
          elevation: 4.0,
          child: ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text(
                "Logout",
                style: TextStyle(
                    color: screen == "customer" ? kOrangeColor : kPurpleColor,
                    fontSize: 17.0),
              ),
              onTap: () async {
                FirebaseService service = new FirebaseService();
                service.signOutFromGoogle();
                Navigator.pushReplacementNamed(context, OnBoard.id);
              }),
        )
      ],
    );
  }
}
