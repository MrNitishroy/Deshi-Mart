import 'package:deshi_mart/pages/Settings/Widgets/BrandsSettings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
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
                  "Settings",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              children: [
                Text("Maintenance mode"),
                Transform.scale(
                  scale:
                      0.7, // Adjust the scale as needed (0.7 means 70% of the original size)
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 30),
        const Row(
          children: [
            Expanded(child: BrandsSettings()),
            SizedBox(width: 10),
            Expanded(child: BrandsSettings()),
          ],
        )
      ],
    );
  }
}
