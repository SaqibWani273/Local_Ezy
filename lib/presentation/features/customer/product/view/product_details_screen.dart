import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/repositories/customer/customer_data_repository.dart';
import '/data/repositories/customer/customer_profile_repository.dart';
import '/presentation/features/customer/cart/cart_screen.dart';
import '/utils/utils.dart';
import '../../../../../data/models/customer.dart';
import '../../../../../data/models/product.dart';
import '../../appbar_widget.dart';
import '../../authentication/view/customer_login.dart';
import '../../dashboard/view/widgets/large_sliding_images_widget.dart';
import '../../dashboard/view_model/customer_data_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    Customer? customer = context.read<CustomerDataRepository>().customer;
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
                          CartIcon(customer: customer)
                        ]),
                  ),
                  Hero(
                    tag: product.id!,
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
                // if (product.colors.isNotEmpty)
                //   SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: product.colors
                //           .map((e) => Container(
                //                 height: 40,
                //                 width: 40,
                //                 margin: EdgeInsets.symmetric(
                //                     horizontal: deviceWidth * 0.03),
                //                 decoration: BoxDecoration(
                //                   color: Colors.green,
                //                   shape: BoxShape.circle,
                //                   // borderRadius: BorderRadius.circular(24.0),
                //                 ),
                //               ))
                //           .toList(),
                //     ),
                //   ),
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
                // if (product.reviews != null && product.reviews!.isNotEmpty)
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           "Reviews",
                //           style: Theme.of(context).textTheme.headlineSmall,
                //         ),
                //       ),
                //       ...product.reviews!.map((e) => Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   e.username,
                //                   style:
                //                       Theme.of(context).textTheme.headlineSmall,
                //                 ),
                //                 //to do : add uploadDateTime feild to
                //                 // review model
                //                 Text(DateTime.now().dayMonthYearFormatted),
                //                 const SizedBox(
                //                   height: 10,
                //                 ),

                //                 Row(
                //                   children: List.generate(
                //                       5,
                //                       (index) => Icon(
                //                             Icons.star,
                //                             color: index >= e.rating
                //                                 ? Colors.grey
                //                                 : Colors.blue,
                //                           )),
                //                 ),
                //                 if (e.image != null)
                //                   Center(
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Image.asset(
                //                         e.image!,
                //                         alignment: Alignment.center,
                //                         width: deviceWidth * 0.7,
                //                       ),
                //                     ),
                //                   ),
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.symmetric(vertical: 8.0),
                //                   child: Text(e.review),
                //                 ),
                //                 const Divider()
                //               ])),
                //     ],
                //   )
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
                    onPressed: () async {
                      //not logged in
                      if (customer == null) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerLogin()),
                        );
                      } else {
                        //logged in
                        context.read<CustomerDataBloc>().add(
                            CustomerDataAddProductToCartEvent(
                                product: product));
                        Utils.showScaffoldMessage(
                            message: "Added to Cart",
                            context: context,
                            actionWidget: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return CartScreen();
                                }));
                              },
                              child: Text("View Cart"),
                            ));
                      }
                    },
                    child: Text(
                      "Add to Cart",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.grey.shade300),
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
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
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
