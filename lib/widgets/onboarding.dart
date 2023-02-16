import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35.0, bottom: 20),
      child: Column(
        children: [
          const Text(
            'Discover the world with us',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            'Experience seamless travel planning and booking with our user-friendly app',
            style: TextStyle(color: Colors.black45, height: 1.8),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 22,
          ),
          SizedBox(
            width: 250,
            height: 42,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B9AAA)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: const Text('Start Your Adventure')),
          )
        ],
      ),
    );
  }
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();
  int _currentIndex = 0;
  final List<String> _images = [
    "assets/images/veneza.jpg",
    "assets/images/japao.jpg",
    "assets/images/japao.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, right: 25, top: 32, bottom: 10),
      child: Column(
        children: [
          SizedBox(
            height: 450,
            child: PageView.builder(
                controller: _controller,
                pageSnapping: false,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  final marginRight = (index + 1) != _images.length ? 5.0 : 0.0;

                  return OnboardingImage(
                      imageUrl: _images[index],
                      marginRight: marginRight,
                      width: 200,
                      height: 400,
                      fit: BoxFit.fill);
                },
                onPageChanged: (value) => setState(() {
                      _currentIndex = value;
                    })),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                _images.length, (index) => _buildDots(index: index)),
          ),
        ],
      ),
    );
  }

  AnimatedContainer _buildDots({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: _currentIndex == index
              ? const Color(0xFF1B9AAA)
              : Colors.grey.shade300),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      curve: Curves.easeIn,
      width: _currentIndex == index ? 22 : 8,
    );
  }
}

class OnboardingImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final double marginRight;

  const OnboardingImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height,
      required this.fit,
      required this.marginRight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
        ),
      ),
    );
  }
}
