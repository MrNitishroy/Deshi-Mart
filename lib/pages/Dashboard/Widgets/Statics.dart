import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:deshi_mart/const/Values.dart';
import 'package:deshi_mart/widgets/HoverEffect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeStatics extends StatelessWidget {
  final String lable;
  final String value;
  final String icon;
  const HomeStatics(
      {super.key,
      required this.lable,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return HoverEffect(builder: (isHover) {
      return AnimatedContainer(
          duration: DefaultValue.animationDuration,
          margin: const EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isHover
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: lable == "Total Order"
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                      : lable == "Pending Order"
                          ? Color(0xffEE0000).withOpacity(0.2)
                          : lable == "Processing Order"
                              ? Color(0xff1400FC).withOpacity(0.2)
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                  icon,
                  width: 25,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lable,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              )
            ],
          ));
    });
  }
}
