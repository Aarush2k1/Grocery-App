import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/size_config.dart';

class InfoCard extends StatelessWidget {
  final String icon;
  final String label;
  final String amount;

  InfoCard({required this.icon, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 100,
        minWidth: 150,
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kPurpleColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SvgPicture.asset(icon, width: 35),
          SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            amount,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
