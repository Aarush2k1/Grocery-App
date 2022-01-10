import 'package:product_io/models/grocieries.dart';

class Cart {
  final Groceries product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});

  Map<String, dynamic> toJson() => {
        "product": product,
        "numOfItem": numOfItem,
      };
}
