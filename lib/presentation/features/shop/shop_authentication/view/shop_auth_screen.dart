import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/data/models/basic_user_model.dart';
import 'package:mca_project/data/models/shop_model.dart';
import 'package:mca_project/presentation/common/widgets/email_sent_widget.dart';
import 'package:mca_project/presentation/common/widgets/form_widget.dart';
import 'package:mca_project/presentation/features/shop/shop_home_page.dart';

import '../view_model/shop_auth_bloc.dart';

class ShopAuthScreen extends StatefulWidget {
  const ShopAuthScreen({super.key});

  @override
  State<ShopAuthScreen> createState() => _ShopAuthScreenState();
}

class _ShopAuthScreenState extends State<ShopAuthScreen> {
  @override
  void initState() {
    context.read<ShopAuthBloc>().add(ShopAuthInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<ShopAuthBloc, ShopAuthState>(listener: (context, state) {
        if (state is ShopAuthLoggedInState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ShopHomePage(),
            ),
            (route) => false,
          );
        }
      }, builder: (context, state) {
        if (state is ShopAuthLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShopAuthEmailSentState) {
          return EmailSentWidget(onPressed: null);
        }
        if (state is ShopAuthErrorState) {
          return Center(child: Text(state.message));
        }

        return FormWidget(
          registerCallback: (
                  {required email, required password, required username}) =>
              context.read<ShopAuthBloc>().add(ShopAuthRegisterEvent(ShopModel(
                  user: BasicUserModel(
                      username: username, password: password, email: email),
                  image: '',
                  categories: [],
                  description: 'description',
                  location: Location(
                      latitude: 121,
                      longitude: 121,
                      completeAddress: 'location-address',
                      locationName: 'Location-name'),
                  contactInfo: ContactInfo(phone: 121, email: email)))),
          loginCallback: ({required email, required password}) => context
              .read<ShopAuthBloc>()
              .add(ShopAuthLoginEvent(email, password)),
        );
      }),
    );
  }
}
