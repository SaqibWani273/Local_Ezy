import 'package:flutter/material.dart';
import 'package:mca_project/data/models/product_model.dart';
import 'package:mca_project/presentation/features/dashboard/view/widgets/large_sliding_images_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: CustomScrollView(
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
                product.description,
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
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(product.description),
              Text(product.price.toString()),
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
              Text(product.description),
              Text(product.price.toString()),
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
              Text(product.description),
              Text(product.price.toString()),
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
              Text(product.description),
              Text(product.price.toString()),
            ])),
          )
        ],
      )),
    );
  }
}
