import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/views/login.screen.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../widgets/onboarding.view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  final List<PageModel> onboardingPagesList = [
    PageModel(
      widget: OnboardingView(
          path: uitmLogo,
          title: 'Welcome to Alumni Hub',
          desc: 'An app to notify you about UITM\'s alumni events'),
    ),
    PageModel(
      widget: OnboardingView(
          path: uitmLogo,
          title: 'Add Your Own Events',
          desc:
              'You also can add event that you want to organize to other users'),
    ),
    PageModel(
      widget: OnboardingView(
          path: uitmLogo,
          title: 'Discover New Interest',
          desc: 'Get the latest alumni events here'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: index,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return Column(
              children: [
                index == pagesLength - 1 ? _getStartedButton : Container(),
                const SizedBox(
                  height: 140,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: DotsIndicator(
                    dotsCount: pagesLength,
                    position: index.toDouble(),
                    onTap: (position) => {
                      setState(() {
                        index = position.toInt();
                      })
                    },
                    decorator: DotsDecorator(
                      activeColor: kPrimaryColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget get _getStartedButton {
    return OutlinedButton(
      onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          RouteAnimate(builder: (context) => const LoginScreen()),
          (route) => false),
      child: Text(
        'GET STARTED',
        style: TextStyle(color: kPrimaryColor, fontSize: 14),
      ),
    );
  }
}
