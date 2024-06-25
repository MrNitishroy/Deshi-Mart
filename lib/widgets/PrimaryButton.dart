import 'package:deshi_mart/widgets/HoverEffect.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  const PrimaryButton(
      {super.key,
      required this.name,
      required this.icon,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: HoverEffect(
          builder: (isHover) => AnimatedContainer(
            duration: Duration(milliseconds: 400),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isHover ? color : color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isHover ? Colors.white : color,
                  size: 20,
                ),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(
                    color: isHover ? Colors.white : color,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
