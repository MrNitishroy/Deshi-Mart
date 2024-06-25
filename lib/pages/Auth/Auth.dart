import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:deshi_mart/pages/Auth/Widget/AuthFields.dart';
import 'package:deshi_mart/pages/Auth/Widget/AuthInfo.dart';
import 'package:deshi_mart/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: 500,
              width: w / 2,
              child: const Row(
                children: [
                  Expanded(child: AuthInfo()),
                  Expanded(child: AuthFields()),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
