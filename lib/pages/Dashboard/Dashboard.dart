import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: 30),
      ],
    );
  }
}
