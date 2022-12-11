import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<Map<String, String>> images = [
    {
      "image": "assets/images/carosel.png",
    },
    {
      "image": "assets/images/Acer_header.png",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
          initialPage: 0,
          autoPlay: true,
          height: MediaQuery.of(context).size.height * 0.25),
      itemBuilder: (context, index, i) => Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 0),
                spreadRadius: 0,
                blurRadius: 4,
                color: Colors.grey)
          ],
          image: DecorationImage(
            image: AssetImage(
              images[index]["image"]!,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
