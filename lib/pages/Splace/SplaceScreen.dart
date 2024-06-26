import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../configs/AssetsPath.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.8, end: 1.2)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    splaceHandle();
  }

  Future<void> splaceHandle() async {
    if (auth.currentUser != null) {
      context.go("/home");
    } else {
      context.go("/auth");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ScaleTransition(
        scale: animation,
        child: SvgPicture.asset(
          IconsAssets.deshimarticon,
          width: 150,
        ),
      )),
    );
  }
}
