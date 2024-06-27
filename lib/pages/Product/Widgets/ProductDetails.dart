import 'package:deshi_mart/models/Category.dart';
import 'package:deshi_mart/models/SubCategory.dart';
import 'package:deshi_mart/pages/Category/Widget/CategoryDropDown.dart';
import 'package:deshi_mart/pages/Category/Widget/SubCategory.dart';
import 'package:deshi_mart/providers/CategoryProvider.dart';
import 'package:deshi_mart/widgets/MyDropDownButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../providers/AddProductProvider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final subCategory = ValueNotifier<List<SubCategory>>([]);
    final addProductProvider = Provider.of<AddProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.dashboard),
                    SizedBox(width: 10),
                    Text('Product Details'),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.1),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Product name',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: addProductProvider.name,
                  decoration: InputDecoration(
                    hintText: 'Product name',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 5,
                  controller: addProductProvider.description,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Category',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Consumer<CategoryProvider>(builder: (context, valu, child) {
                  return CategorySearchDropDownButton(
                    items: valu.categories,
                    selectedValue: (value) {
                      if (value != null) {
                        subCategory.value = value.subCategories!;
                        addProductProvider.selectedCategory = value.title!;
                      }
                    },
                    hintText: "Select Category",
                  );
                }),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Sub-Category',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ValueListenableBuilder(
                    valueListenable: subCategory,
                    builder: (context, value, child) {
                      return SubCategorySearchDropDownButton(
                        items: subCategory.value,
                        selectedValue: (value) {
                          if (value != null) {
                            print(value.title);
                            addProductProvider.selectedSubCategory =
                                value.title!;
                          }
                        },
                        hintText: "Select Sub Category",
                      );
                    }),
                SizedBox(height: 20),
                // Row(
                //   children: [
                //     Text(
                //       'Sub-Category',
                //       style: Theme.of(context).textTheme.bodyMedium,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10),
                // Row(
                //   children: [
                //     Text('Active'),
                //     SizedBox(width: 10),
                //     Transform.scale(
                //       scale: 0.5,
                //       child: Switch(value: true, onChanged: (value) {}),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
