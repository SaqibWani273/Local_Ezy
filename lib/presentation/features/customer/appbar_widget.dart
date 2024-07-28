import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/customer.dart';
import '../../../data/repositories/customer/customer_data_repository.dart';
import 'cart/cart_screen.dart';
import 'dashboard/view_model/customer_data_bloc.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<CustomerDataBloc, CustomerDataState>(
        builder: (context, state) {
          if (state is CustomerDataLoadedState) {
            Customer? customer =
                context.read<CustomerDataRepository>().customer;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ShopLocal'),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon:
                            const Icon(size: 30, Icons.notifications_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            size: 30, Icons.favorite_outline_outlined)),
                    CartIcon(customer: customer),
                  ],
                )
              ],
            );
          }

          return const Text('ShopLocal');
        },
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
    required this.customer,
  });

  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CartScreen();
              }));
            },
            icon: const Icon(size: 30, Icons.shopping_cart_outlined)),
        Positioned(
          child: Text(
            customer == null ||
                    customer!.cartItems == null ||
                    customer!.cartItems!.isEmpty
                ? '0'
                : customer!.cartItems!.length.toString(),
            style: TextStyle(color: Colors.purple),
          ),
          right: 0,
          top: 0,
        )
      ],
    );
  }
}
