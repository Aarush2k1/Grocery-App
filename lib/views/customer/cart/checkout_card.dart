// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class CheckoutCard extends StatelessWidget {
  CheckoutCard({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);
  double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: (15),
        horizontal: (30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: kOrangeColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: (40),
                  width: (40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text(
                  "Add voucher code",
                  style: TextStyle(color: kWhiteColor),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kWhiteColor,
                )
              ],
            ),
            SizedBox(height: (10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style: TextStyle(color: kWhiteColor),
                    children: [
                      TextSpan(
                        text: "₹ ${totalPrice}",
                        style: TextStyle(fontSize: 16, color: kWhiteColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: (140),
                  child: MaterialButton(
                    color: kWhiteColor,
                    child: Text(
                      "Checkout",
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
