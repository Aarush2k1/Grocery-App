// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Groceries {
  final int id;
  final String title, description;
  final String images;
  final double price;
  final bool isPopular;

  Groceries({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    this.price = 0.0,
    this.isPopular = false,
  });
}

List<Groceries> demoGroceries = [
  Groceries(
    id: 1,
    images: "assets/images/grocery_images/apple.png",
    title: "Apple",
    description: "description",
    price: 100,
    isPopular: true,
  ),
  Groceries(
    id: 2,
    images: "assets/images/grocery_images/banana.png",
    title: "Banana",
    description: "description",
    price: 50,
    isPopular: true,
  ),
  Groceries(
    id: 3,
    images: "assets/images/grocery_images/beef.png",
    title: "Beef",
    description: "description",
    price: 150,
  ),
  Groceries(
    id: 4,
    images: "assets/images/grocery_images/ginger.png",
    title: "Ginger",
    description: "description",
    price: 25,
    isPopular: true,
  ),
  Groceries(
    id: 5,
    images: "assets/images/grocery_images/chicken.png",
    title: "Chicken",
    description: "description",
    price: 125,
  ),
  Groceries(
    id: 6,
    images: "assets/images/grocery_images/pepper.png",
    title: "Pepper",
    description: "description",
    price: 15,
    isPopular: true,
  ),
  Groceries(
    id: 7,
    images: "assets/images/grocery_images/guava.jpg",
    title: "Guava",
    description: "description",
    price: 15,
    isPopular: true,
  ),
  Groceries(
    id: 8,
    images: "assets/images/grocery_images/kiwi.jpg",
    title: "Kiwi",
    description: "description",
    price: 15,
  ),
  Groceries(
    id: 9,
    images: "assets/images/grocery_images/black-grapes.jpg",
    title: "Black Grapes",
    description: "description",
    price: 15,
  ),
];
