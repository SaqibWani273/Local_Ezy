import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/drawer_widget.dart';

import '../../../constants/bottom_navbar_items.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int currentIndex = 2;
  int currentDrawerItemIndex = 0;
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('ShopLocal'),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined)),
              ],
            )
          ],
        ),
      ),
      drawer: DrawerWidget(
        currentIndex: currentDrawerItemIndex,
        homePageContext: context,
      ),
      body: mainScreens[currentIndex],
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
  }
}
