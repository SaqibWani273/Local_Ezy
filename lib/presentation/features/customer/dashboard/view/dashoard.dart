import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/common/widgets/loading_widgets.dart';
import '/presentation/common/widgets/show_cupertino_alert_dialog.dart';
import '/presentation/features/customer/dashboard/view/widgets/shop_loading_screen.dart';
import '/presentation/features/customer/product/view/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common/widgets/my_text_field_widget.dart';
import '/data/repositories/customer/customer_data_repository.dart';
import '/presentation/features/customer/dashboard/view_model/customer_data_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController locationController = TextEditingController();
  @override
  void initState() {
    if (context.read<CustomerDataRepository>().getProducts == null) {
      //to load Customer data from db using auht token from secure storage
      // context.read<CustomerAuthBloc>().add(CustomerAuthVerificationEvent());
      context.read<CustomerDataBloc>().add(LoadCustomerDataEvent());
    }
    super.initState();
  }

  Widget AddressWidget(double height) {
    return Container(
      alignment: Alignment.center,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 30,
                  color: Colors.purple,
                ),
                Text(
                  context
                              .read<CustomerDataRepository>()
                              .currentSelectedLocation ==
                          null
                      ? "Global"
                      : context
                          .read<CustomerDataRepository>()
                          .currentSelectedLocation!
                          .shortAddress,
                  // softWrap: true,
                  // overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(0.0),
                backgroundColor:
                    WidgetStateProperty.all(Colors.blue.withOpacity(0.2)),
              ),
              onPressed: () {
                showCupertinoAlertDialog(
                    context: context,
                    controller: locationController,
                    title: "Change Location",
                    content: "Enter Valid Location Name Here");
              },
              child: const Text(
                'Change Location',
                style: TextStyle(color: Colors.black),
              )),
          //images
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<CustomerDataBloc, CustomerDataState>(
          builder: (context, state) {
        if (state is CustomerDataErrorState) {
          return Scaffold(
            body: Center(child: Text(state.error)),
          );
        }
        if (state is CustomerDataLoadingState) {
          //show shimmer loading here
          // return const Center(child: CircularProgressIndicator());
          return ShopLocalLoadingScreen();
        }
        if (state is CustomerDataLoadedState) {
          final products = context.read<CustomerDataRepository>().getProducts;
          if (products == null || products.isEmpty) {
            return Center(child: Text("No Products here !!!"));
          }
          return CustomScrollView(slivers: [
            // const SliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                //search bar here
                const MyTextFieldWidget(
                  hintText: 'Search for everything,styles and brands',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Icon(Icons.mic), Icon(Icons.camera_alt)],
                    ),
                  ),
                ),
                //address here
                if (state.isChangingLocation == true)
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: AddressWidget(deviceHeight * 0.15),
                  ),
                if (state.isChangingLocation == null)
                  AddressWidget(deviceHeight * 0.15),
              ]),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: deviceHeight * 0.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(product: products[index]),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: deviceHeight < 550 ? 1 : 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0)),
                                child: Hero(
                                  tag: products[index].id!,
                                  child: Image.network(
                                      fit: BoxFit.fill,
                                      height: deviceHeight * 0.2,
                                      // width: deviceWidth * 0.4,
                                      products[index].images.first),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 20.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text(products[index].name)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                        "₹" + products[index].price.toString()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]);
        }
        return LoadingWidgets.SpinKitFading(deviceWidth);
      }),
    );
  }
}
