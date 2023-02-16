import 'package:flutter/material.dart';
import 'package:mrei_travel_app/pages/arrow_buttom.dart';
import 'package:mrei_travel_app/widgets/onboarding.dart';

import 'pages/introduction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: IntroductionPage(),
        ),
      ),
    );
  }
}
