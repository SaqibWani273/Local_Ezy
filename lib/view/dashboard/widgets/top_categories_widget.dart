import 'package:flutter/material.dart';
import 'package:mca_project/constants/data.dart';
import 'package:mca_project/view/categories/categories_screen.dart';

class TopCategoriesWidget extends StatelessWidget {
  // final
  // VoidCallback viewAllCategories;
  const TopCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.0),
            physics: NeverScrollableScrollPhysics(),
            children: categories
                .where((category) => category.isTopCategory)
                .map((e) => Image.asset(
                      e.image,
                      fit: BoxFit.fill,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
