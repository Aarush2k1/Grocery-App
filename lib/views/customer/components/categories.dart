// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/models/categories.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ],
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        categories[index].image,
                        height: 55,
                        width: 55,
                      ),
                      Text(
                        categories[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kOrangeColor, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
