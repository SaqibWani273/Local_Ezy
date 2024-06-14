import 'package:flutter/material.dart';
import 'package:mca_project/presentation/features/categories/view/category_screen.dart';
import 'package:mca_project/presentation/common/widgets/my_text_field_widget.dart';

import '../../../../utils/constants/data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MyTextFieldWidget(
            hintText: 'Search For Categories',
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
          //create a common gridview widget later
          Expanded(
            child: GridView(
              padding: const EdgeInsets.only(bottom: 24.0),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.0),
              // physics: NeverScrollableScrollPhysics(),
              children: categories
                  .where((element) => !element.isTopCategory)
                  .map((e) => InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoryScreen(category: e),
                        )),
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    e.image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(e.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: 24.0),
                                    overflow: TextOverflow.ellipsis),
                              ],
                            )),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}