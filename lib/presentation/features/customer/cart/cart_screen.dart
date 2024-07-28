import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/data/repositories/customer/customer_data_repository.dart';
import 'package:mca_project/data/repositories/customer/customer_profile_repository.dart';
import 'package:mca_project/presentation/features/customer/cart/widgets/empty_cart_screen.dart';
import 'package:mca_project/presentation/features/customer/dashboard/view_model/customer_data_bloc.dart';

import '../../../../data/models/cart.dart';
import '../../../../data/models/customer.dart';
import '../authentication/view/customer_login.dart';
import '../product/view/product_details_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Customer? customer;
  bool isCartEmpty = false;
  @override
  void initState() {
    customer = context.read<CustomerDataRepository>().customer;
    if (customer != null) {
      checkIsCartEmpty(customer);
    }

    super.initState();
  }

  void checkIsCartEmpty(Customer? customer) {
    isCartEmpty = customer == null ||
        customer.cartItems == null ||
        customer.cartItems!.isEmpty;
  }

  void updateState() {
    setState(() {
      customer = context.read<CustomerDataRepository>().customer;
      checkIsCartEmpty(customer);
    });
  }

  Widget NotLoggedIn() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Not Logged In'),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CustomerLogin()),
              );
              updateState();
            },
            label: Text("Login Here"),
            icon: Icon(Icons.login),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customer == null
          ? NotLoggedIn()
          : isCartEmpty
              ? EmptyCartScreen()
              : ListView.builder(
                  itemCount: customer!.cartItems!.length,
                  itemBuilder: (context, index) {
                    final cartItem = customer!.cartItems![index];

                    return ListTile(
                      leading: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: cartItem.product),
                          ),
                        ),
                        child: Image.network(cartItem.product.images.first),
                      ), // Replace with image loading logic
                      title: Text(cartItem.product.name),
                      subtitle: Text(
                          '${cartItem.product.price} - Quantity: ${cartItem.quantity}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Quantity selector (e.g., using a number picker or custom buttons)
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (cartItem.quantity > 1) {
                                  // cartItem.quantity--;
                                  customer!.cartItems![index].quantity--;
                                  customer = customer;
                                }
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              // Handle quantity increase
                              setState(() {
                                customer!.cartItems![index].quantity++;
                                customer = customer;
                              });
                            },
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context.read<CustomerDataBloc>().add(
                                    CustomerDataRemoveProductFromCartEvent(
                                        product: cartItem.product));
                                setState(() {
                                  customer!.cartItems!.remove(cartItem);
                                  customer = customer;
                                  checkIsCartEmpty(customer);
                                });
                              }),
                        ],
                      ),
                    );
                  },
                ),
      bottomNavigationBar: customer == null || isCartEmpty
          ? null
          : CartBottomBar(cartItems: customer!.cartItems!),
    );
  }
}

class CartBottomBar extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartBottomBar({super.key, required this.cartItems});

  double calculateTotalPrice(List<CartItem> cartItems) {
    double totalPrice = 0.0;

    for (var cartItem in cartItems) {
      totalPrice += cartItem.product.price * cartItem.quantity;
    }

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:'),
                Text('₹${calculateTotalPrice(cartItems)}'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle checkout
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
