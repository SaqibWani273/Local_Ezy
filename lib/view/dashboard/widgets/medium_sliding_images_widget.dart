import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mca_project/view/product_details/product_details_screen.dart';

import '../../../models/product_model.dart';
import '../../../models/shop_model.dart';

class MediumSlidingImagesWidget extends StatelessWidget {
  //one of the two parameters is required, products or shops
  final List<ProductModel>? products;
  final List<ShopModel>? shops;
  final double aspectRatio;
  final String title;
  final double viewportFraction;
  final bool? hasContainer;
  final bool? hasSubtitle;
  final Function(int) onTap;
  final Widget? titleActionWidget;
  final Widget? parentWidget;
  const MediumSlidingImagesWidget({
    super.key,
    this.products,
    this.shops,
    required this.onTap,
    required this.aspectRatio,
    required this.title,
    required this.viewportFraction,
    this.hasContainer = false,
    this.hasSubtitle = false,
    this.titleActionWidget,
    this.parentWidget,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final shopsOrProducts = products ?? shops;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (titleActionWidget != null) titleActionWidget!,
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CarouselSlider(
          options: CarouselOptions(
            clipBehavior: Clip.none,
            enableInfiniteScroll: false,
            aspectRatio: aspectRatio,
            padEnds: false,
            // enlargeCenterPage: true,

            viewportFraction: viewportFraction,
            onPageChanged: (index, reason) {},
          ),
          items: shopsOrProducts!
              .map(
                (e) => hasContainer!
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        // height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                                flex: 5,
                                child: ImageWithTitle(
                                    e: e, hasSubtitle: hasSubtitle!)),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: 16.0,
                                  left: deviceWidth > 500 ? 8.0 : 16.0,
                                  right: deviceWidth > 500 ? 8.0 : 16.0,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Shop Now',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: 14.0),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    // backgroundColor: Colors.green.withOpacity(0.01),
                                    foregroundColor: Colors.green,
                                    backgroundColor:
                                        Colors.white.withOpacity(0.6),
                                    minimumSize: Size.fromWidth(150),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Add rounded corners
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          deviceWidth > 500 ? 8.0 : 16.0,
                                    ), // Adjust padding as needed
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ImageWithTitle(e: e, hasSubtitle: hasSubtitle!),
                      ),
              )
              .toList(),
        )
      ]),
    );
  }
}

class ImageWithTitle extends StatelessWidget {
  final dynamic e;
  final bool hasSubtitle;
  const ImageWithTitle({super.key, required this.e, required this.hasSubtitle});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          if (e is ProductModel) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                product: e,
              ),
            ));
          } else {}
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: Hero(
                tag: e is ProductModel ? e.id : (e as ShopModel).name,
                child: Image.asset(
                  e is ProductModel ? e.images.first : (e as ShopModel).image,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (frame == null) {
                      return Container(
                        color: Colors.grey.withOpacity(0.5),
                      );
                    }
                    return child;
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      e is ProductModel ? e.name : (e as ShopModel).name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: deviceWidth > 400 ? 18.0 : 12.0,
                              overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  if (hasSubtitle && e is ShopModel)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("${e.rating} stars",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: deviceWidth > 400 ? 18.0 : 12.0,
                                  overflow: TextOverflow.ellipsis)),
                    ),
                  if (hasSubtitle && e is ProductModel)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("₹ ${e.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: deviceWidth > 400 ? 18.0 : 12.0,
                                      overflow: TextOverflow.ellipsis)),
                          Spacer(),
                          if (e.previousPrice != null)
                            Text("₹ ${e.previousPrice}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize:
                                            deviceWidth > 400 ? 18.0 : 12.0,
                                        overflow: TextOverflow.ellipsis,
                                        decoration:
                                            TextDecoration.lineThrough)),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
//.....
