import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthInfo extends StatelessWidget {
  const AuthInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Column(
                      children: [
                        SvgPicture.asset(IconsAssets.appIcon),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            SvgPicture.asset(InfoIconsAssets.leaf),
                            SizedBox(width: 10),
                            Text(
                              "Organic Groceries",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(),
                          height: 2,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(InfoIconsAssets.food),
                            SizedBox(width: 10),
                            Text(
                              "Whole foods and vegetable",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(),
                          height: 2,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(InfoIconsAssets.bus),
                            SizedBox(width: 10),
                            Text(
                              "Fast Delivery",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(),
                          height: 2,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(InfoIconsAssets.moneybag),
                            SizedBox(width: 10),
                            Text(
                              "East Refund and return",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(),
                          height: 2,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(InfoIconsAssets.secure),
                            SizedBox(width: 10),
                            Text(
                              "Secure and safe",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
  }
}