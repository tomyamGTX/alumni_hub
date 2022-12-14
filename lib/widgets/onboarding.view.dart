import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  final String path;
  final String title;
  final String desc;
  const OnboardingView(
      {Key? key, required this.path, required this.desc, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.0,
          color: Colors.white,
        ),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 45.0, right: 45, top: 70.0, bottom: 0),
              child: Image.asset(path),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                title,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                desc,
                style: infoStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
