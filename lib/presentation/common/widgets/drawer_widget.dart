import 'package:flutter/material.dart';
import '/utils/constants/drawer_data.dart';
import '/utils/constants/theme_const.dart';

class DrawerWidget extends StatelessWidget {
  final int currentIndex;
  const DrawerWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: ListView(
        // Remove padding from top
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'ShopLocal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ...menuItems.asMap().entries.map((item) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: currentIndex == item.key
                      ? Colors.grey.shade300
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(48.0),
                ),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: deviceWidth * 0.07),
                    child: Text(
                      item.value.title,
                      style: overfLowTextStyle(
                          deviceWidth: deviceWidth,
                          deviceHeight: deviceHeight,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 20.0)),
                    ),
                  ),
                  leading: Icon(currentIndex == item.key
                      ? item.value.selectedIcon
                      : item.value.unSelectedIcon),
                  onTap: () {
                    // Navigate to corresponding page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => getNavigationPage(item.title)),
                    // );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
