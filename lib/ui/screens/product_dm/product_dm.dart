class ProductDm {
  String title;
  String description;
  String imgPath;
  String rate;
  String reviews;
  String price;
  int quantity;

  ProductDm({
    required this.title,
    required this.description,
    required this.price,
    required this.rate,
    required this.reviews,
    required this.imgPath,
    this.quantity = 1,
  });
}