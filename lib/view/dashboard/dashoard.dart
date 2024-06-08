import 'package:flutter/material.dart';
import 'package:mca_project/constants/sliding_images.dart';
import 'package:mca_project/view/dashboard/widgets/medium_sliding_images_widget.dart';
import 'package:mca_project/view/dashboard/widgets/large_sliding_images_widget.dart';

import '../../constants/data.dart';
import 'widgets/top_categories_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ShopLocal'),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for everything,styles and brands',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade300,
              suffixIcon: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.mic), Icon(Icons.camera_alt)],
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 70.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          color: Colors.grey.shade300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined),
                  Text('Sringar,190001'),
                ],
              ),
              TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(20.0),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.5)),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Change Address',
                    style: TextStyle(color: Colors.black),
                  )),
              //images
            ],
          ),
        ),
        SizedBox(height: 10.0),
        // SlidingImagesWidget(),
        LargeSlidingImagesWidget(
          slidingImages: bannerImages,
        ),

        TopCategoriesWidget(),

        //FEatured Items
        MediumSlidingImagesWidget(
          aspectRatio: 16 / 7,
          title: "Featured Items",
          viewportFraction: 0.45,
          products: featuredItems,
          onTap: (int) {},
        ),
        SizedBox(height: 20),
        //Top Rated Shops
        MediumSlidingImagesWidget(
          aspectRatio: 16 / 12,
          title: "Top Rated Shops",
          viewportFraction: 0.45,
          shops: topRatedShops,
          hasSubtitle: true,
          onTap: (int) {},
        ),

        //for special offers
        LargeSlidingImagesWidget(
          slidingImages: specialOfferImages,
          title: "Special Offers",
        ),

        //Products You May Like
        MediumSlidingImagesWidget(
          products: productsMayLike,
          aspectRatio: 16 / 12,
          title: "Products You May Like",
          viewportFraction: 0.45,
          hasContainer: true,
          onTap: (int) {},
        ), //Trending now
        MediumSlidingImagesWidget(
          aspectRatio: 16 / 12,
          title: "Trending Now",
          viewportFraction: 0.45,
          products: trendingNow,
          hasSubtitle: true,
          onTap: (int) {},
        ),
        //add sale offers here

        //popular shops
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          // height: 80,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Shops",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.0),
                physics: NeverScrollableScrollPhysics(),
                children: popularShops
                    .map((e) => Image.asset(
                          e.image,
                          fit: BoxFit.fill,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        //top picks for you
        MediumSlidingImagesWidget(
          aspectRatio: 16 / 12,
          title: "Top Picks For You",
          viewportFraction: 0.75,
          products: topPicksForYou,
          hasSubtitle: true,
          onTap: (int) {},
        ),
        //More Products
        MediumSlidingImagesWidget(
          aspectRatio: 16 / 9,
          title: "More Products",
          viewportFraction: 0.45,
          products: moreProducts,
          hasSubtitle: true,
          onTap: (int) {},
        ),
        // ProductsMayLike(),
      ]),
    );
  }
}
