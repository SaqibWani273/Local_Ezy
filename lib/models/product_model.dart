class ProductModel {
  String name;
  String image;
  int price;
  int? previousPrice;
  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    this.previousPrice,
  });
}
