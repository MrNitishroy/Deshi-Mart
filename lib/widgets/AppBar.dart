import 'package:deshi_mart/providers/AuthProvider.dart';
import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ResponsiveLayout.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final authProvider = Provider.of<AuthProvider>(context);
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
          SizedBox(width: 20),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == "profile") {
                print("Go to Profile Page");
              } else if (value == 'logout') {
                authProvider.logout(context);
              } else if (value == 'profile') {}
            },
            tooltip: "",
            position: PopupMenuPosition.under,
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('Profile Settings'),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
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
                      authProvider.auth.currentUser!.email![0].toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    authProvider.auth.currentUser!.email ?? "Root",
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
        ],
      ),
    );
  }
}
