// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/models/productsVM.dart';
import 'package:product_io/views/customer/cart/cart_screen.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150.0,
        width: 30.0,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CartScreen()));
          },
          child: Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: kWhiteColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  }),
              Positioned(
                  child: Stack(
                children: <Widget>[
                  Icon(Icons.brightness_1, size: 20.0, color: kWhiteColor),
                  Positioned(
                    top: 3.0,
                    right: 6.0,
                    child: Center(
                      child: Consumer<ProductsVM>(
                        builder: (context, value, child) => Text(
                          value.lst.length.toString(),
                          style: TextStyle(
                              color: kOrangeColor,
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
