import 'package:alumni_hub/providers/authentication.dart';
import 'package:alumni_hub/views/events/home.screen.dart';
import 'package:alumni_hub/views/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authentication>(builder: (context, app, _) {
      if (app.user == null) {
        return const OnBoardingScreen();
      } else {
        return const HomeScreen();
      }
    });
  }
}
