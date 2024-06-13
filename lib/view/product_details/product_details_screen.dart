import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mca_project/models/product_model.dart';
import 'package:mca_project/view/dashboard/widgets/large_sliding_images_widget.dart';

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
                  padding: EdgeInsets.only(
                      top: 48.0, left: 8.0, right: 8.0, bottom: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_sharp,
                            size: 30,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
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
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "₹ ${product.price}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(product.description),
              Text(product.price.toString()),
              SizedBox(
                height: 20,
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(product.description),
              Text(product.price.toString()),
              SizedBox(
                height: 20,
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Text(product.description),
              Text(product.price.toString()),
              SizedBox(
                height: 20,
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
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
