import 'package:mca_project/models/product_model.dart';
import 'package:mca_project/models/shop_model.dart';

Map<String, String> featuredItemsImages = {
  "Leather Jackets": "assets/images/featured_items/l_j1.png",
  "Denim Jackets": "assets/images/featured_items/d_j1.png",
  "Wool Coats": "assets/images/featured_items/coat1.png",
  "Dresses": "assets/images/featured_items/dress1.png",
  "Boots": "assets/images/featured_items/boots1.png",
};
List<ProductModel> featuredItems = [
  ProductModel(
      name: "Leather Jackets",
      image: "assets/images/featured_items/l_j1.png",
      price: 1000),
  ProductModel(
      name: "Denim Jackets",
      image: "assets/images/featured_items/d_j1.png",
      price: 1000),
  ProductModel(
      name: "Wool Coat",
      image: "assets/images/featured_items/coat1.png",
      price: 1000),
  ProductModel(
      name: "Dress",
      image: "assets/images/featured_items/dress1.png",
      price: 1000),
  ProductModel(
      name: "Boots",
      image: "assets/images/featured_items/boots1.png",
      price: 1000),
];
List<ProductModel> moreProducts = [
  ProductModel(
    name: "Sneakers",
    image: "assets/images/more_products/1.png",
    price: 1480,
  ),
  ProductModel(
    name: "BackPAck",
    image: "assets/images/more_products/2.png",
    price: 198,
  ),
  ProductModel(
    name: "Laptop Case",
    image: "assets/images/more_products/3.png",
    price: 78,
  ),
];
List<ProductModel> topPicksForYou = [
  ProductModel(
    name: "White Dress",
    image: "assets/images/top_picks/1.png",
    price: 1980,
    previousPrice: 2000,
  ),
  ProductModel(
    name: "Floral Print dress",
    image: "assets/images/top_picks/2.png",
    price: 1700,
    previousPrice: 200,
  ),
];
List<ProductModel> trendingNow = [
  ProductModel(
    name: "Gucci Bag",
    image: "assets/images/trending_now/1.png",
    price: 4200,
    previousPrice: 5000,
  ),
  ProductModel(
    name: "Channel Bag",
    image: "assets/images/trending_now/2.png",
    price: 2000,
    previousPrice: 2500,
  ),
  ProductModel(
    name: "Cannon Camera",
    image: "assets/images/trending_now/3.png",
    price: 2200,
    previousPrice: 2500,
  ),
];
List<ProductModel> productsMayLike = [
  ProductModel(
      name: "Gucci Bag",
      image: "assets/images/products_may_like/1.png",
      price: 2000),
  ProductModel(
      name: "Channel Bag",
      image: "assets/images/products_may_like/2.png",
      price: 1500),
  ProductModel(
      name: "Cannon Camera",
      image: "assets/images/products_may_like/3.png",
      price: 2000),
];
//shop data

List<ShopModel> popularShops = [
  ShopModel(
      name: "Shop 1", image: "assets/images/popular_shops/1.png", rating: 4.9),
  ShopModel(
      name: "Shop 2", image: "assets/images/popular_shops/2.png", rating: 4.8),
  ShopModel(
      name: "Shop 3", image: "assets/images/popular_shops/3.png", rating: 4.7),
  ShopModel(
      name: "Shop 1", image: "assets/images/popular_shops/1.png", rating: 4.9),
  ShopModel(
      name: "Shop 2", image: "assets/images/popular_shops/2.png", rating: 4.8),
  ShopModel(
      name: "Shop 3", image: "assets/images/popular_shops/3.png", rating: 4.7),
];
List<ShopModel> topRatedShops = [
  ShopModel(
      name: "Shop 1",
      image: "assets/images/top_rated_shops/1.png",
      rating: 4.9),
  ShopModel(
      name: "Shop 2",
      image: "assets/images/top_rated_shops/2.png",
      rating: 4.8),
  ShopModel(
      name: "Shop 3",
      image: "assets/images/top_rated_shops/3.png",
      rating: 4.7),
];
//large Sliding images
List<String> bannerImages = [
  // "assets/images/dummy_images/pngImg1.png",
  "assets/images/dummy_images/pngImg.png",
  "assets/images/dummy_images/pngImg.png",
  "assets/images/dummy_images/pngImg.png",
  "assets/images/dummy_images/pngImg.png",
];
List<String> specialOfferImages = [
  // "assets/images/dummy_images/pngImg1.png",
  "assets/images/dummy_images/pngImg.png",
  "assets/images/dummy_images/pngImg.png",
  "assets/images/dummy_images/pngImg.png",
  "assets/images/dummy_images/pngImg.png",
];
