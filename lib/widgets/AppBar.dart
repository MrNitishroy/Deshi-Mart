
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Spacer(),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search here...",
                fillColor:
                    Theme.of(context).colorScheme.background,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.dark_mode,
            ),
          ),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primary,
                  child: Text(
                    "N",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground,
                        ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Nitish Kumar",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer),
                )
              ],
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
