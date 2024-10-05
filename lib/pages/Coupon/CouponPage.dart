import 'package:deshi_mart/pages/Category/Widget/CategoryDataTable.dart';
import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:deshi_mart/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/CategoryProvider.dart';
import 'Widget/CouponDataTable.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 7,
              height: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
            Text(
              "CategoryPage",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyIconButton(
              icon: Icons.refresh,
              color: Colors.orange,
              onTap: () {},
            ),
            SizedBox(width: 10),
            PrimaryButton(
              name: "Export",
              icon: Icons.import_export_sharp,
              onTap: () {},
              color: Colors.deepPurple,
            ),
            SizedBox(width: 10),
            PrimaryButton(
              name: "Add New",
              icon: Icons.add,
              onTap: () {
                context.go('/addCategory');
              },
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        CouponDataTable()
      ],
    );
  }
}
