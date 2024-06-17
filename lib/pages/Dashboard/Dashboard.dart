import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:deshi_mart/pages/Dashboard/Widgets/OrderHistory.dart';
import 'package:deshi_mart/pages/Dashboard/Widgets/Statics.dart';
import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:deshi_mart/widgets/PrimaryButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    var statics = [
      {
        "icon": IconsAssets.cart,
        "lable": "Total Order",
        "value": "2343",
      },
      {
        "icon": IconsAssets.refresh,
        "lable": "Pending Order",
        "value": "123",
      },
      {
        "icon": IconsAssets.car,
        "lable": "Processing Order",
        "value": "76",
      },
      {
        "icon": IconsAssets.done,
        "lable": "Completed Order",
        "value": "32",
      },
    ];
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  height: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 10),
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
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
              name: "Import",
              icon: Icons.download_rounded,
              onTap: () {},
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: statics
              .map(
                (e) => Expanded(
                  child: HomeStatics(
                      lable: e["lable"]!, value: e["value"]!, icon: e["icon"]!),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 30),
        Orderhistory(),
        SizedBox(height: 30),
        SizedBox(height: 30),
        SizedBox(height: 30),
        SizedBox(height: 30),
      ],
    );
  }
}
