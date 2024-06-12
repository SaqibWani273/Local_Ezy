import 'package:mca_project/models/product_model.dart';
import 'package:mca_project/models/shop_model.dart';

import '../models/category_model.dart';

// Map<String, String> featuredItemsImages = {
//   "Leather Jackets": "assets/images/featured_items/l_j1.png",
//   "Denim Jackets": "assets/images/featured_items/d_j1.png",
//   "Wool Coats": "assets/images/featured_items/coat1.png",
//   "Dresses": "assets/images/featured_items/dress1.png",
//   "Boots": "assets/images/featured_items/boots1.png",
// };
// List<ProductModel> featuredItems = [
//   ProductModel(
//     id: "f_l_jacket_001", // Unique ID for Leather Jackets
//     name: "Leather Jackets",
//     image: "assets/images/featured_items/Leather jackets.png",
//     price: 1000,
//   ),
//   ProductModel(
//     id: "f_d_jacket_002", // Unique ID for Denim Jackets
//     name: "Denim Jackets",
//     image: "assets/images/featured_items/Denim jackets.png",
//     price: 1000,
//   ),
//   ProductModel(
//     id: "f_wool_coat_003", // Unique ID for Wool Coat
//     name: "Wool Coat",
//     image: "assets/images/featured_items/wool coats.png",
//     price: 1000,
//   ),
//   ProductModel(
//     id: "f_dress_004", // Unique ID for Dress
//     name: "Dress",
//     image: "assets/images/featured_items/Dresses.png",
//     price: 1000,
//   ),
//   ProductModel(
//     id: "f_boots_005", // Unique ID for Boots
//     name: "Boots",
//     image: "assets/images/featured_items/boots.png",
//     price: 1000,
//   ),
// ];
List<ProductModel> featuredItems = [
  ProductModel(
    id: "f_l_jacket_001", // Unique ID for Leather Jackets
    name: "Leather Jackets",
    image: "assets/images/featured_items/Leather jackets.png",
    price: 1000,
    description:
        "Stay warm and stylish with our high-quality leather jackets. Made from premium materials, these jackets are perfect for any occasion.",
  ),
  ProductModel(
    id: "f_d_jacket_002", // Unique ID for Denim Jackets
    name: "Denim Jackets",
    image: "assets/images/featured_items/Denim jackets.png",
    price: 1000,
    description:
        "A timeless classic, denim jackets are a must-have for any wardrobe. Our selection offers a variety of washes and styles to suit your taste.",
  ),
  ProductModel(
    id: "f_wool_coat_003", // Unique ID for Wool Coat
    name: "Wool Coat",
    image: "assets/images/featured_items/wool coats.png",
    price: 1000,
    description:
        "Wrap yourself in luxury with our soft and cozy wool coats. Perfect for the colder months, these coats will keep you warm and looking your best.",
  ),
  ProductModel(
    id: "f_dress_004", // Unique ID for Dress
    name: "Dress",
    image: "assets/images/featured_items/Dresses.png",
    price: 1000,
    description:
        "Find the perfect dress for any occasion in our extensive collection. From casual to formal, we have a dress to flatter every figure.",
  ),
  ProductModel(
    id: "f_boots_005", // Unique ID for Boots
    name: "Boots",
    image: "assets/images/featured_items/boots.png",
    price: 1000,
    description:
        "Complete your outfit with a stylish pair of boots. We offer a variety of styles, from ankle boots to knee-high boots, to suit your needs.",
  ),
];

// List<ProductModel> moreProducts = [
//   ProductModel(
//     id: "m_sneakers_006", // Unique ID for Sneakers
//     name: "Sneakers",
//     image: "assets/images/more_products/4.png",
//     price: 1480,
//   ),
//   ProductModel(
//     id: "m_backpack_007", // Unique ID for BackPAck
//     name: "Backpack",
//     image: "assets/images/more_products/2.png",
//     price: 198,
//   ),
//   ProductModel(
//     id: "m_laptop_case_008", // Unique ID for Laptop Case
//     name: "Laptop Case",
//     image: "assets/images/more_products/3.png",
//     price: 78,
//   ),
// ];
List<ProductModel> moreProducts = [
  ProductModel(
    id: "m_sneakers_006", // Unique ID for Sneakers
    name: "Sneakers",
    image: "assets/images/more_products/4.png",
    price: 1480,
    description:
        "Comfortable and stylish, sneakers are a great choice for everyday wear. Our selection includes a variety of brands and styles to choose from.",
  ),
  ProductModel(
    id: "m_backpack_007", // Unique ID for Backpack
    name: "Backpack",
    image: "assets/images/more_products/2.png",
    price: 198,
    description:
        "Carry all your essentials in style with our durable and comfortable backpacks. Perfect for school, work, or travel.",
  ),
  ProductModel(
    id: "m_laptop_case_008", // Unique ID for Laptop Case
    name: "Laptop Case",
    image: "assets/images/more_products/3.png",
    price: 78,
    description:
        "Protect your laptop in style with our sleek and functional laptop cases. Available in a variety of sizes to fit most laptops.",
  ),
];

// List<ProductModel> topPicksForYou = [
//   ProductModel(
//     id: "t_white_dress_009", // Unique ID for White Dress
//     name: "White Dress",
//     image: "assets/images/top_picks/1.png",
//     price: 1980,
//     previousPrice: 2000,
//   ),
//   ProductModel(
//     id: "t_floral_dress_010", // Unique ID for Floral Print dress
//     name: "Floral Print dress",
//     image: "assets/images/top_picks/2.png",
//     price: 1700,
//     previousPrice: 200,
//   ),
// ];
List<ProductModel> topPicksForYou = [
  ProductModel(
    id: "t_white_dress_009", // Unique ID for White Dress
    name: "White Dress",
    image: "assets/images/top_picks/1.png",
    price: 1980,
    previousPrice: 2000,
    description:
        "This stunning white dress is perfect for any special occasion. Made from high-quality materials, it features a flattering silhouette and elegant details. Turn heads with this timeless piece.",
  ),
  ProductModel(
    id: "t_floral_dress_010", // Unique ID for Floral Print dress
    name: "Floral Print dress",
    image: "assets/images/top_picks/2.png",
    price: 1700,
    previousPrice: 200,
    description:
        "Embrace your feminine side with this beautiful floral print dress. The vibrant colors and playful pattern are perfect for spring and summer. This dress is sure to become a favorite in your wardrobe.",
  ),
];

// List<ProductModel> trendingNow = [
//   ProductModel(
//     id: "tn_gucci_bag_011", // Unique ID for Gucci Bag
//     name: "Gucci Bag",
//     image: "assets/images/trending_now/1.png",
//     price: 4200,
//     previousPrice: 5000,
//   ),
//   ProductModel(
//     id: "tn_channel_bag_012", // Unique ID for Channel Bag
//     name: "Channel Bag",
//     image: "assets/images/trending_now/2.png",
//     price: 2000,
//     previousPrice: 2500,
//   ),
//   ProductModel(
//     id: "tn_cannon_camera_013", // Unique ID for Cannon Camera
//     name: "Cannon Camera",
//     image: "assets/images/trending_now/3.png",
//     price: 2200,
//     previousPrice: 2500,
//   ),
// ];
List<ProductModel> trendingNow = [
  ProductModel(
    id: "tn_gucci_bag_011", // Unique ID for Gucci Bag
    name: "Gucci Bag",
    image: "assets/images/trending_now/1.png",
    price: 4200,
    previousPrice: 5000,
    description:
        "Make a statement with this iconic Gucci bag. This luxurious accessory is crafted from the finest materials and features a timeless design. Be the envy of everyone with this must-have piece.",
  ),
  ProductModel(
    id: "tn_channel_bag_012", // Unique ID for Channel Bag
    name: "Channel Bag",
    image: "assets/images/trending_now/2.png",
    price: 2000,
    previousPrice: 2500,
    description:
        "Experience the epitome of luxury with this elegant Channel bag. This classic design is perfect for any occasion and will elevate your style to new heights. Invest in a piece that will never go out of fashion.",
  ),
  ProductModel(
    id: "tn_cannon_camera_013", // Unique ID for Cannon Camera
    name: "Cannon Camera",
    image: "assets/images/trending_now/3.png",
    price: 2200,
    previousPrice: 2500,
    description:
        "Capture your memories in stunning detail with this advanced Cannon camera. Packed with features, this camera is perfect for both amateur and professional photographers alike. Take your photography skills to the next level with this powerful tool.",
  ),
];

// List<ProductModel> productsMayLike = [
//   ProductModel(
//     id: "pml_gucci_bag_014", // Unique ID for Gucci Bag
//     name: "Gucci Bag",
//     image: "assets/images/products_may_like/1.png",
//     price: 200,
//   ),
//   ProductModel(
//     id: "pml_channel_bag_015", // Unique ID for Channel Bag
//     name: "Channel Bag",
//     image: "assets/images/products_may_like/2.png",
//     price: 200,
//   ),
//   ProductModel(
//     id: "pml_cannon_camera_016", // Unique ID for Cannon Camera
//     name: "Cannon Camera",
//     image: "assets/images/products_may_like/3.png",
//     price: 200,
//   ),
// ];
List<ProductModel> productsMayLike = [
  ProductModel(
    id: "pml_gucci_bag_014", // Unique ID for Gucci Bag
    name: "Gucci Bag",
    image: "assets/images/products_may_like/1.png",
    price: 2000, // Update price if this is a genuine Gucci bag
    description:
        "Look and feel like a star with this inspired Gucci bag design. This bag is crafted with high-quality materials and features a stylish design that is reminiscent of the iconic Gucci brand. Elevate your everyday look at a fraction of the price.",
  ),
  ProductModel(
    id: "pml_channel_bag_015", // Unique ID for Channel Bag
    name: "Channel Bag",
    image: "assets/images/products_may_like/2.png",
    price: 200,
    description:
        "Embrace classic elegance with this timeless channel-inspired bag. This affordable bag features a sophisticated design that is perfect for any occasion. Add a touch of luxury to your wardrobe without breaking the bank.",
  ),
  ProductModel(
    id: "pml_cannon_camera_016", // Unique ID for Cannon Camera
    name: "Cannon Camera",
    image: "assets/images/products_may_like/3.png",
    price: 200,
    description:
        "Capture life's moments with this user-friendly Cannon camera. This camera is packed with features that are perfect for capturing memories on the go. Take your first steps into the world of photography with this affordable and easy-to-use camera.",
  ),
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

List<Category> categories = [
  Category(
      name: "Shoes",
      image: "assets/images/categories/shoes.png",
      isTopCategory: true,
      products: []),
  Category(
      name: "Bags",
      image: "assets/images/categories/bags.png",
      isTopCategory: true,
      products: []),
  Category(
      name: "Jewelery",
      image: "assets/images/categories/jewelery.png",
      isTopCategory: true,
      products: []),
  Category(
      name: "Clothing",
      image: "assets/images/categories/clothing.png",
      isTopCategory: true,
      products: []),
  Category(
      name: "Sneakers",
      image: "assets/images/categories/2.png",
      isTopCategory: false,
      products: []),
  Category(
      name: "KitchenWare",
      image: "assets/images/categories/4.png",
      isTopCategory: false,
      products: []),
  Category(
      name: "Fashion",
      image: "assets/images/categories/3.png",
      isTopCategory: false,
      products: []),
  Category(
      name: "Mobiles",
      image: "assets/images/categories/mobiles.png",
      isTopCategory: false,
      products: []),
  Category(
      name: "Gifts",
      image: "assets/images/categories/5 (1).png",
      isTopCategory: false,
      products: []),
  Category(
      name: "Bags",
      image: "assets/images/categories/5 (2).png",
      isTopCategory: false,
      products: []),
  Category(
      name: "Furniture",
      image: "assets/images/categories/5 (3).png",
      isTopCategory: false,
      products: []),
  Category(
      name: "Sports",
      image: "assets/images/categories/5 (4).png",
      isTopCategory: false,
      products: []),
  Category(
      name: "Toys",
      image: "assets/images/categories/5 (5).png",
      isTopCategory: false,
      products: []),
  Category(
      name: "Electronics",
      image: "assets/images/categories/5 (6).png",
      isTopCategory: false,
      products: []),
];
