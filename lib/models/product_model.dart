class ProductModel {
  String id;
  String name;
  String image;
  int price;
  String description;
  int? previousPrice;
  ProductModel({
    required this.name,
    required this.id,
    required this.image,
    required this.price,
    required this.description,
    this.previousPrice,
  });
}
