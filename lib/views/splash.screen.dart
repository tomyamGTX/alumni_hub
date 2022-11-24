import 'dart:async';

import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/views/onboarding.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer time;
  @override
  void initState() {
    time = Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          RouteAnimate(builder: (context) => const OnBoardingScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Image.asset(
          uitmLogo,
          width: 120,
          height: 120,
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(56.0),
          child: Text(
            appName,
            style: titleStyle,
          ),
        )
      ],
    )));
  }
}
