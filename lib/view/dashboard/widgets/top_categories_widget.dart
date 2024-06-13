import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mca_project/constants/data.dart';
import 'package:mca_project/constants/theme_const.dart';
import 'package:mca_project/view/categories/categories_screen.dart';

class TopCategoriesWidget extends StatelessWidget {
  // final
  // VoidCallback viewAllCategories;
  const TopCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      // height: 80,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Categories",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.5))),
                    onPressed: () {},
                    child: Text(
                      "view all",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 24.0,
                              color: Colors.blue.withOpacity(0.9)),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 16 / 12),
            physics: NeverScrollableScrollPhysics(),
            children: categories
                .where((category) => category.isTopCategory)
                .map((e) => Container(
                      padding: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            e.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Text(
                            e.name,
                            style: overfLowTextStyle(
                                deviceWidth: deviceWidth,
                                deviceHeight: deviceHeight,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(fontSize: 24.0)),
                          ),
                        )
                      ]),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
