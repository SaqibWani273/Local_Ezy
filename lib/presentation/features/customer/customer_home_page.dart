import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/presentation/features/customer/appbar_widget.dart';
import 'package:mca_project/presentation/features/customer/dashboard/view_model/customer_data_bloc.dart';
import '../../../data/models/customer.dart';
import '../../../data/repositories/customer/customer_data_repository.dart';
import '../../common/widgets/drawer_widget.dart';

import '../../../constants/bottom_navbar_items.dart';
import 'cart/cart_screen.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int currentIndex = 2;
  int currentDrawerItemIndex = 0;
  Customer? customer;
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    customer = context.read<CustomerDataRepository>().customer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CustomerDataBloc, CustomerDataState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              child: AppBarWidget(),
              preferredSize: deviceHeight > 600
                  ? Size.fromHeight(deviceHeight * 0.05)
                  : Size.fromHeight(deviceHeight * 0.09)),
          drawer: DrawerWidget(
            currentIndex: currentDrawerItemIndex,
            homePageContext: context,
          ),
          body: RefreshIndicator.adaptive(
              onRefresh: () async {
                return context
                    .read<CustomerDataBloc>()
                    .add(LoadCustomerDataEvent());
              },
              child: mainScreens[currentIndex]),
          bottomNavigationBar: CurvedNavigationBar(
            index: 2,
            items: bottomNavbarItems
                .asMap()
                .entries
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      // height: deviceHeight * 0.05,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(currentIndex == e.key
                              ? e.value.selectedIcon
                              : e.value.unselectedIcon),
                          Text(
                            e.value.label,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ))
                .toList(),
            onTap: (value) => {
              changeIndex(value),
            },
          ),
        );
      },
    );
  }
}
