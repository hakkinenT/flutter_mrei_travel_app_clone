import 'package:flutter/material.dart';

import '../widgets/onboarding.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: SafeArea(
          child: ListView(
            children: const [
              Onboarding(),
              SizedBox(
                height: 20,
              ),
              DescriptionText()
            ],
          ),
        ));
  }
}
