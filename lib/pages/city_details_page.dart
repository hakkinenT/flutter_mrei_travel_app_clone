import 'dart:ui';

import 'package:flutter/material.dart';

class CityDetailsPage extends StatelessWidget {
  final Map<String, String> city;
  const CityDetailsPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(city["image-url"]!), fit: BoxFit.cover)),
          ),
          Positioned(
              top: 390,
              left: 15,
              width: 330,
              height: 230,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city['description-title']!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              city["description"]!,
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.6),
                                  fontSize: 18,
                                  height: 1.5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
