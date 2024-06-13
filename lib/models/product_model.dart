class ProductModel {
  String id;
  String name;
  List<String> images;
  int price;
  String description;
  int? previousPrice;
  ProductModel({
    required this.name,
    required this.id,
    required this.images,
    required this.price,
    required this.description,
    this.previousPrice,
  });
}
