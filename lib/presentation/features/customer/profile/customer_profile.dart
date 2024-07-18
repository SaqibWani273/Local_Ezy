import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/constants/image_constants.dart';
import '/data/models/customer.dart';
import '/data/repositories/customer/customer_profile_repository.dart';
import '/presentation/features/customer/authentication/view/customer_login.dart';

import '../authentication/view_model/customer_auth_bloc.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<CustomerAuthBloc>(context),
        builder: (context, state) {
          Customer? customer =
              context.read<CustomerProfileRepository>().customer;
          if (state is CustomerAuthLoggedInState || customer != null) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Centered avatar
                  Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: const AssetImage(ImageConstants
                          .defaultProfileImage), // Replace with your asset path
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  Text(
                    customer!.user.email,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    customer.user.username,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<CustomerAuthBloc>()
                            .add(CustomerLogoutEvent());
                      },
                      child: Text('Logout')),
                ],
              ),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You are not logged in'),
                ElevatedButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerLogin()),
                        ),
                    child: Text("Login")),
              ],
            ),
          );
        });
  }
}
