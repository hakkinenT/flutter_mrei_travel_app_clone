import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrei_travel_app/pages/arrow_buttom.dart';
import 'package:mrei_travel_app/pages/city_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/images/japao.jpg",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: "Hi, ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                              text: "Andrew",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16))
                        ]),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Ready for your next adventure?",
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.w500, height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xFFB9B9B9),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF1F1F1),
                    hintText: "Search destination",
                    hintStyle: TextStyle(color: Color(0xFFB9B9B9))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  FilterChip(
                    padding: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    label: const Text(
                      "Mountain",
                      style: TextStyle(color: Color(0xFFACACAC), fontSize: 16),
                    ),
                    onSelected: (bool selected) {},
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FilterChip(
                    padding: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    label: const Text(
                      "Beach",
                      style: TextStyle(color: Color(0xFFACACAC), fontSize: 16),
                    ),
                    onSelected: (bool selected) {},
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FilterChip(
                    padding: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    label: const Text(
                      "Forest",
                      style: TextStyle(color: Color(0xFFACACAC), fontSize: 16),
                    ),
                    onSelected: (bool selected) {},
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "We give you recommendation",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 16,
              ),
              const CityGalery(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 140,
                    height: 42,
                    child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            side: const BorderSide(color: Color(0xFF1B9AAA))),
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline,
                            color: Color(0xFF1B9AAA)),
                        label: const Text(
                          'Favorite',
                          style:
                              TextStyle(color: Color(0xFF1B9AAA), fontSize: 16),
                        )),
                  ),
                  const ArrowLeftButton(
                    strokeWidth: 2,
                    color: Colors.grey,
                    arrowSize: 15,
                  ),
                  const ArrowRightButton(
                      color: Color(0xFF1B9AAA), strokeWidth: 3, arrowSize: 15)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CityGalery extends StatefulWidget {
  const CityGalery({super.key});

  @override
  State<CityGalery> createState() => _CityGaleryState();
}

class _CityGaleryState extends State<CityGalery> {
  List<Map<String, String>> cities = [
    {
      "city": "Tokyo",
      "country": "Japan",
      "image-url": "assets/images/japao.jpg",
      "description-title": "The Capital of Japan",
      "description": "Tokyo, the capital of Japan, "
          "is a vibrant and bustling city that offers "
          "a unique blend of traditional and modern culture. "
          "Known for its cutting-edge technology, delicious cuisine, "
          "and stunning architecture, Tokyo is a must-see destination "
          "for any traveler."
    },
    {
      "city": "Venezia",
      "country": "Italy",
      "image-url": "assets/images/veneza.jpg",
      "description-title": "The City of Italy",
      "description":
          "Tokyo, the capital of Japan is a vibrant and bustling city that offers"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
          itemCount: cities.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final marginRight = (index + 1) != cities.length ? 20.0 : 0.0;
            final city = cities[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CityDetailsPage(city: city)));
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: marginRight),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        city["image-url"]!,
                        width: 300,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 285,
                      left: 15,
                      width: 270,
                      height: 100,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
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
                                Text(
                                  '${city["city"]}, ${city["country"]}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            );
          }),
    );
  }
}
