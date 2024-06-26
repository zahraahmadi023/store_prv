class Category {
  final String title;
  final String image;
  Category({required this.title, required this.image});
}

final List<Category> categoryList = [
  Category(title: "All", image: "images/shoes.png"),
  Category(title: "Shose", image: "images/shoes.png"),
  Category(title: "women's \nFashion", image: "images/image1.png"),
  Category(title: "Beauty", image: "images/beauty.png"),
  Category(title: "Jewelry", image: "images/jewelry.png"),
  Category(title: "men's\n Fashion", image: "images/men.png"),
];
