// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/models/grocieries.dart';
import 'package:product_io/models/productsVM.dart';
import 'package:provider/provider.dart';

class PopularGroceries extends StatelessWidget {
  const PopularGroceries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Selling",
                  style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                Text(
                  "What's New",
                  style: TextStyle(
                      color: kGreyColor2,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 6, right: 6),
              itemCount: demoGroceries.length,
              itemBuilder: (context, index) {
                if (demoGroceries[index].isPopular)
                  return GroceryCard(
                    grocery: demoGroceries[index],
                  );
                return SizedBox(
                  height: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GroceryCard extends StatelessWidget {
  const GroceryCard({Key? key, required this.grocery}) : super(key: key);

  final Groceries grocery;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Image.asset(
            grocery.images,
            height: 65,
            width: 155,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                grocery.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "₹" + grocery.price.toString(),
                  style: TextStyle(color: kGreyColor1),
                ),
              ),
              Consumer<ProductsVM>(
                builder: (context, value, child) => MaterialButton(
                    height: 30,
                    minWidth: 50,
                    child: Text(
                      "+ Add",
                      style: TextStyle(color: kWhiteColor),
                    ),
                    color: kOrangeColor,
                    onPressed: () {
                      value.add(grocery, 1);
                      print("added");
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
