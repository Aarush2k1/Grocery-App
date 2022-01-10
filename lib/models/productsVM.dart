// ignore_for_file: prefer_collection_literals, deprecated_member_use, file_names, iterable_contains_unrelated_type

import 'package:flutter/widgets.dart';
import 'package:product_io/models/cart.dart';
import 'package:product_io/models/grocieries.dart';

class ProductsVM with ChangeNotifier {
  List<Cart> lst = List<Cart>.empty(growable: true);

  add(Groceries product, int num) {
    lst.add(Cart(product: product, numOfItem: num));
    notifyListeners();
  }

  del(int index) {
    lst.removeAt(index);
    notifyListeners();
  }
}
