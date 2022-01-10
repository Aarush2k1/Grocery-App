// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/models/cart.dart';
import 'package:product_io/models/productsVM.dart';
import 'package:product_io/views/customer/cart/checkout_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0;
  @override
  void initState() {
    _getTotal();
    super.initState();
  }

  double _getTotal() {
    Consumer<ProductsVM>(
      builder: (context, value, child) {
        setState(() {
          value.lst.forEach((element) {
            total += element.product.price;
          });
        });
        return Text("");
      },
    );
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsVM>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: (20)),
            child: ListView.builder(
                itemCount: value.lst.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          value.del(index);
                        });
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: kSecondaryOrangeColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            SvgPicture.asset("assets/icons/Trash.svg"),
                          ],
                        ),
                      ),
                      child: CartCard(cart: value.lst[index]),
                    ),
                  );
                }),
          ),
          bottomNavigationBar: CheckoutCard(
            totalPrice: _getTotal(),
          ),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: kWhiteColor),
      backgroundColor: kOrangeColor,
      title: Column(
        children: [
          Consumer<ProductsVM>(
            builder: (context, value, child) => Text(
              "Your Cart (${value.lst.length})",
              style: TextStyle(color: kWhiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Grocery Image
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all((10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images),
            ),
          ),
        ),
        SizedBox(width: 20),
        // Grocery Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "₹ ${cart.product.price}",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: kOrangeColor),
                children: [
                  TextSpan(
                      text: "  x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
