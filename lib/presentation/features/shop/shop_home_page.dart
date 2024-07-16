import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/presentation/features/shop/product_upload/upload_product_screen.dart';
import 'package:mca_project/presentation/features/shop/shop_authentication/view/shop_auth_screen.dart';

import 'shop_authentication/view_model/shop_auth_bloc.dart';

class ShopHomePage extends StatelessWidget {
  const ShopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ShopAuthBloc, ShopAuthState>(
        listener: (context, state) {
          if (state is ShopAuthLoggedOutState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const ShopAuthScreen()),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Shop Home Page'),
                SizedBox(height: 20),
                IconButton(
                    onPressed: () =>
                        context.read<ShopAuthBloc>().add(ShopAuthLogoutEvent()),
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 30,
                    )),
                SizedBox(height: 80),
                IconButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const UploadProductScreen())),
                    icon: Icon(Icons.add)),
              ],
            ),
          );
        },
      ),
    );
  }
}
