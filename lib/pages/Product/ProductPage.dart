import 'package:deshi_mart/const/data.dart';
import 'package:deshi_mart/pages/Product/Widgets/ProductTable.dart';
import 'package:deshi_mart/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 7,
                  height: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 10),
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              children: [
                PrimaryButton(
                    name: "Add Product", icon: Icons.add, onTap: () {})
              ],
            )
          ],
        ),
        SizedBox(height: 30),
        AllProductsTable(),
      ],
    );
  }
}
