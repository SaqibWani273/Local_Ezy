import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mca_project/view/common_widgets/drawer_widget.dart';

import '../constants/bottom_navbar_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Text('ShopLocal'),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
              ],
            )
          ],
        ),
      ),
      drawer: DrawerWidget(
        currentIndex: currentDrawerItemIndex,
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
