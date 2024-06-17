import 'package:deshi_mart/widgets/MyDropDownButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../providers/AddProductService.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var category = [
      "Electronic",
      "Clothing",
    ];

    final addProductService = Provider.of<AddProductService>(context);
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
                  controller: addProductService.productNameController,
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
                  controller: addProductService.descriptionController,
                  maxLines: 5,
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
                SearchDropDownButton(
                  items: category,
                  selectedValue: (value) {
                    addProductService.selectedCategory = value ?? "";
                  },
                  hintText: "Select Category",
                ),
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
                SearchDropDownButton(
                  items: category,
                  selectedValue: (value) {
                    addProductService.selectedSubCategory = value ?? "";
                  },
                  hintText: "Select Sub Category",
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
