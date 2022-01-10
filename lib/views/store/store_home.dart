// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/models/categories.dart';
import 'package:product_io/components/app_drawer.dart';
import 'package:product_io/views/store/components/bar_chart.dart';
import 'package:product_io/views/store/components/info_card.dart';
import 'package:product_io/views/store/components/subscriber_chart.dart';

class StoreHome extends StatelessWidget {
  static String id = "store";
  const StoreHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kWhiteColor),
        backgroundColor: kPurpleColor,
        title: Text("Stores"),
        actions: [
          // Manage Store
          Icon(Icons.store),
        ],
      ),
      drawer: Drawer(
        child: AppDrawer(
          screen: "store",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // Total Sales
            Container(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  InfoCard(
                      icon: "assets/icons/fruit_icons.svg",
                      label: "Total Sales",
                      amount: "₹ 2000"),
                  SizedBox(
                    width: 10,
                  ),
                  InfoCard(
                      icon: "assets/icons/fruit_icons.svg",
                      label: "Products Sold",
                      amount: "75"),
                  SizedBox(
                    width: 10,
                  ),
                  InfoCard(
                      icon: "assets/icons/fruit_icons.svg",
                      label: "New Customers",
                      amount: "10"),
                ],
              ),
            ),
            //Send Personal message to customer
            Container(),
            // Graph of Products sold
            SizedBox(
              height: 10,
            ),
            Center(child: SubscriberChart(data: data)),
            // Categories
            Text(
              "Categories",
              style: TextStyle(
                  color: kPurpleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              color: kWhiteColor,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: List.generate(
                  categories.length,
                  (index) {
                    return Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        color: kSecondaryPurpleColor,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: kPurpleColor),
                            borderRadius: BorderRadius.circular(10)),
                        // borderOnForeground: ,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  right: 0,
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: kPurpleColor,
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.only(right: 12, top: 10),
                                  child: Image.asset(
                                    categories[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                    fontSize: 16, color: kPrimaryLabelColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesCard extends StatelessWidget {
  const SalesCard({Key? key, required this.text, required this.number})
      : super(key: key);
  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(
        horizontal: (20),
        vertical: (15),
      ),
      decoration: BoxDecoration(
        color: kPurpleColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: text + "\n"),
            TextSpan(
              text: number.toString(),
              style: TextStyle(
                fontSize: (24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
