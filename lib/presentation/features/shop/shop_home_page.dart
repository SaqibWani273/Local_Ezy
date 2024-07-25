
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_upload/view/upload_product_screen.dart';
import '/presentation/features/shop/shop_authentication/view/shop_auth_screen.dart';

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
                TextButton.icon(
                    onPressed: () =>
                        context.read<ShopAuthBloc>().add(ShopAuthLogoutEvent()),
                    label: Text("Logout"),
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 30,
                    )),
                SizedBox(height: 80),
                TextButton.icon(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const UploadProductScreen())),
                    label: Text("Upload Product"),
                    icon: Icon(
                      Icons.add,
                      size: 30,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
