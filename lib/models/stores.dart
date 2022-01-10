// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Stores {
  final int id;
  final String title, description;
  final double rating;
  final List<String> images;
  final List<Color> colors;
  final bool isPopular;

  Stores({
    required this.id,
    required this.title,
    required this.description,
    this.rating = 0.0,
    required this.images,
    required this.colors,
    this.isPopular = false,
  });
}

List<Stores> demoStores = [
  Stores(
    id: 1,
    images: [
      "assets/images/store_1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFFDECB9C),
    ],
    title: "Genreal Store",
    description: "Beverages, Dairy",
    rating: 4.8,
    isPopular: true,
  ),
  Stores(
    id: 2,
    images: [
      "assets/images/store_2.jpg",
      "assets/images/store_3.jpg",
    ],
    colors: [
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Mini Mart Grocery",
    description: "Vegetables, Fruits",
    rating: 4.5,
    isPopular: true,
  ),
  Stores(
    id: 3,
    images: [
      "assets/images/store_3.jpg",
    ],
    colors: [
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Supermarket",
    description: "Bakery,Beverages,Meat",
    rating: 4.6,
    isPopular: true,
  ),
  Stores(
    id: 4,
    images: [
      "assets/images/store_4.jpg",
    ],
    colors: [
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Veggie Corner",
    description: "Vegetables,",
    rating: 4.3,
    isPopular: true,
  ),
];
