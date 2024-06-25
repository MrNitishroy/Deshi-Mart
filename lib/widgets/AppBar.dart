import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:flutter/material.dart';

import 'ResponsiveLayout.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          if (!isDesktop)
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu)),
          SizedBox(width: 20),
          if (isDesktop) Spacer(),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search here...",
                fillColor: Theme.of(context).colorScheme.surface,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyIconButton(
                icon: Icons.dark_mode,
                onTap: () {},
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ],
          ),
          SizedBox(width: 20),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      "N",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Nitish Kumar",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
