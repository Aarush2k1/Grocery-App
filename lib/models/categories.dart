class Categories {
  final int id;
  final String name;
  final String image;

  Categories({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<Categories> categories = [
  Categories(
      id: 1,
      name: "Fruits",
      image: "assets/images/categories_images/fruit.png"),
  Categories(
      id: 2,
      name: "Beverages",
      image: "assets/images/categories_images/beverages.png"),
  Categories(
      id: 3,
      name: "Cooking oil & ghee",
      image: "assets/images/categories_images/oil.png"),
  Categories(
      id: 4,
      name: "Meat & Fish",
      image: "assets/images/categories_images/meat.png"),
  Categories(
      id: 5,
      name: "Bakery",
      image: "assets/images/categories_images/bakery.png"),
  Categories(
      id: 6, name: "Dairy", image: "assets/images/categories_images/dairy.png"),
];

// void addCategories(int i, String n, String img) {
//   categories.add(
//     Categories(id: i, name: n, image: img),
//   );
//   // notifyListeners();
// }
