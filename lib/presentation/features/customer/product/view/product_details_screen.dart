import 'package:flutter/material.dart';
import 'package:mca_project/utils/extensions/date_formatting.dart';
import '/data/models/product/product_model.dart';
import '../../dashboard/view/widgets/large_sliding_images_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 48.0, left: 8.0, right: 8.0, bottom: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_sharp,
                              size: 30,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_cart,
                                size: 30,
                              ))
                        ]),
                  ),
                  Hero(
                    tag: product.id,
                    child: SizedBox(
                      //my custom widget using CourselSlider
                      child: ImagesWidget(
                        slidingImages: product.images,
                        indicatorColor: Colors.grey.shade700,
                        indicatorWidth: 8.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 20,
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  product.shortDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "₹ ${product.price}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (product.colors.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: product.colors
                          .map((e) => Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.03),
                                decoration: BoxDecoration(
                                  color: e,
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(24.0),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  product.completeDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                //reviews
                if (product.reviews.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Reviews",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      ...product.reviews.map((e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.username,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                //to do : add uploadDateTime feild to
                                // review model
                                Text(DateTime.now().dayMonthYearFormatted),
                                const SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            color: index >= e.rating
                                                ? Colors.grey
                                                : Colors.blue,
                                          )),
                                ),
                                if (e.image != null)
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        e.image!,
                                        alignment: Alignment.center,
                                        width: deviceWidth * 0.7,
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(e.review),
                                ),
                                const Divider()
                              ])),
                    ],
                  )
              ])),
            )
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.white,
            width: deviceWidth,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      "Add to Cart",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade300),
                    ),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: null,
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                  ),
                ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
