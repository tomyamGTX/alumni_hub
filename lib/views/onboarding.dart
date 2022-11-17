import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../widgets/onboarding.view.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final onboardingPagesList = [
      PageModel(
        widget: OnboardingView(
            path: uitmLogo,
            title: 'Hello World',
            desc: 'This is view at index 1'),
      ),
      PageModel(
        widget: OnboardingView(
            path: uitmLogo,
            title: 'Hello World 2',
            desc: 'And this is for view 2'),
      ),
      PageModel(
        widget: OnboardingView(
            path: uitmLogo,
            title: 'Hello World 3',
            desc: 'And this one the last view'),
      ),
    ];

    return Scaffold(
      body: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: background,
              border: Border.all(
                width: 0.0,
                color: Colors.white,
              ),
            ),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        activeIndicator: ActiveIndicator(
                            color: Colors.black, borderWidth: 0.7),
                        closedIndicator: ClosedIndicator(
                            color: Theme.of(context).primaryColor,
                            borderWidth: 0.7),
                        indicatorDesign: IndicatorDesign.polygon(
                            polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_circle)),
                      ),
                    ),
                    index == pagesLength - 1
                        ? _signupButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: Theme.of(context).primaryColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: Theme.of(context).primaryColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {},
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
