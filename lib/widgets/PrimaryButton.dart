import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  const PrimaryButton(
      {super.key, required this.name, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon),
            Text(name),
          ],
        ),
      ),
    );
  }
}
