import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/data/repositories/customer/customer_data_repository.dart';
import 'package:mca_project/presentation/features/customer/authentication/view_model/customer_auth_bloc.dart';
import 'package:mca_project/presentation/features/customer/dashboard/view_model/customer_data_bloc.dart';
import '../../../../common/widgets/my_text_field_widget.dart';

import '../../../../../constants/data.dart';
import '../../../../../constants/images.dart';
import '../../../../../theme/overflow_text_style.dart';
import '../../categories/view/category_screen.dart';
import 'widgets/large_sliding_images_widget.dart';
import 'widgets/medium_sliding_images_widget.dart';
import 'widgets/top_categories_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    //to load Customer data from db using auht token from secure storage
    // context.read<CustomerAuthBloc>().add(CustomerAuthVerificationEvent());
    context.read<CustomerDataBloc>().add(LoadCustomerDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CustomerDataBloc, CustomerDataState>(
        builder: (context, state) {
      if (state is CustomerDataLoadedState) {
        final products = context.read<CustomerDataRepository>().getProducts;
        if (products == null || products.isEmpty) {
          return Scaffold(
            body: Center(child: Text("Nothing here")),
          );
        }
        return Scaffold(
          body: Center(
            child: Text("Nothing here as well"),
          ),
        );
        // return ListView(children: [
        //   const MyTextFieldWidget(
        //     hintText: 'Search for everything,styles and brands',
        //     prefixIcon: Icon(Icons.search),
        //     suffixIcon: SizedBox(
        //       width: 80,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [Icon(Icons.mic), Icon(Icons.camera_alt)],
        //       ),
        //     ),
        //   ),
        //   Container(
        //     alignment: Alignment.center,
        //     height: 70.0,
        //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //     color: Colors.grey.shade300,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         const Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Icon(Icons.location_on_outlined),
        //             Text('Sringar,190001'),
        //           ],
        //         ),
        //         TextButton(
        //             style: ButtonStyle(
        //               elevation: MaterialStateProperty.all(20.0),
        //               backgroundColor: MaterialStateProperty.all(
        //                   Colors.white.withOpacity(0.5)),
        //             ),
        //             onPressed: () {},
        //             child: const Text(
        //               'Change Address',
        //               style: TextStyle(color: Colors.black),
        //             )),
        //         //images
        //       ],
        //     ),
        //   ),
        //   //show subcategories and categories here, like women,men,kids,etc
        //   SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: categories
        //           .where((element) => !element.isTopCategory)
        //           .map(
        //             (e) => InkWell(
        //               onTap: () {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) => CategoryScreen(category: e),
        //                 ));
        //               },
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   // color: Colors.grey.shade100,
        //                   borderRadius: BorderRadius.circular(10.0),
        //                 ),
        //                 margin: const EdgeInsets.symmetric(
        //                     horizontal: 8.0, vertical: 8.0),
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Column(
        //                   children: [
        //                     Image.asset(
        //                       e.image,
        //                       width: 50,
        //                       height: 50,
        //                     ),
        //                     const SizedBox(height: 10.0),
        //                     Text(
        //                       e.name,
        //                       style: overfLowTextStyle(
        //                           deviceWidth: deviceWidth,
        //                           deviceHeight: deviceHeight),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           )
        //           .toList(),
        //     ),
        //   ),
        //   const SizedBox(height: 10.0),
        //   // SlidingImagesWidget(),
        //   LargeSlidingImagesWidget(
        //     slidingImages: bannerImages,
        //     button: ElevatedButton(
        //       style: ButtonStyle(
        //         elevation: MaterialStateProperty.all(20.0),
        //         backgroundColor: MaterialStateProperty.all(Colors.blue),
        //       ),
        //       onPressed: () {},
        //       child:
        //           const Text("Shop Now", style: TextStyle(color: Colors.white)),
        //     ),
        //   ),

        //   const TopCategoriesWidget(),

        //   //FEatured Items
        //   MediumSlidingImagesWidget(
        //     aspectRatio: 16 / 7,
        //     title: "Featured Items",
        //     viewportFraction: 0.45,
        //     products: featuredItems,
        //     onTap: (int) {},
        //   ),
        //   const SizedBox(height: 20),
        //   //Top Rated Shops
        //   MediumSlidingImagesWidget(
        //     aspectRatio: 16 / 12,
        //     title: "Top Rated Shops",
        //     viewportFraction: 0.45,
        //     shops: topRatedShops,
        //     hasSubtitle: true,
        //     onTap: (int) {},
        //   ),

        //   //for special offers
        //   LargeSlidingImagesWidget(
        //     slidingImages: specialOfferImages,
        //     title: "Special Offers",
        //   ),

        //   //Products You May Like
        //   MediumSlidingImagesWidget(
        //     products: productsMayLike,
        //     aspectRatio: 16 / 12,
        //     title: "Products You May Like",
        //     viewportFraction: 0.45,
        //     hasContainer: true,
        //     onTap: (int) {},
        //   ), //Trending now
        //   MediumSlidingImagesWidget(
        //     aspectRatio: 16 / 12,
        //     title: "Trending Now",
        //     viewportFraction: 0.45,
        //     products: trendingNow,
        //     hasSubtitle: true,
        //     onTap: (int) {},
        //   ),
        //   //add sale offers here

        //   //popular shops
        //   Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     // height: 80,
        //     child: Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 "Popular Shops",
        //                 style: Theme.of(context).textTheme.headlineMedium,
        //               ),
        //             ],
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         GridView(
        //           shrinkWrap: true,
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               mainAxisSpacing: 10,
        //               crossAxisSpacing: 10,
        //               childAspectRatio: 1.0),
        //           physics: const NeverScrollableScrollPhysics(),
        //           children: popularShops
        //               .map((e) => Image.asset(
        //                     e.image,
        //                     fit: BoxFit.fill,
        //                   ))
        //               .toList(),
        //         ),
        //       ],
        //     ),
        //   ),
        //   //top picks for you
        //   MediumSlidingImagesWidget(
        //     aspectRatio: 16 / 12,
        //     title: "Top Picks For You",
        //     viewportFraction: 0.75,
        //     products: topPicksForYou,
        //     hasSubtitle: true,
        //     onTap: (int) {},
        //   ),
        //   //More Products
        //   MediumSlidingImagesWidget(
        //     aspectRatio: 16 / 9,
        //     title: "More Products",
        //     viewportFraction: 0.45,
        //     products: moreProducts,
        //     hasSubtitle: true,
        //     onTap: (int) {},
        //   ),
        //   // ProductsMayLike(),
        // ]);
      }
      if (state is CustomerDataErrorState) {
        return Scaffold(
          body: Center(child: Text(state.error)),
        );
      }
      if (state is CustomerDataLoadingState) {
        return Scaffold(
          body: const Center(child: CircularProgressIndicator()),
        );
      }
      return Scaffold(
        body: const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
