import 'package:deshi_mart/widgets/HoverEffect.dart';
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
        child: HoverEffect(
          builder: (isHover) => AnimatedContainer(
            duration: Duration(milliseconds: 400),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isHover
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isHover
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: isHover
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
