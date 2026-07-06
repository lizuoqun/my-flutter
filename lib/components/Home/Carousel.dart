import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../types/home.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<BannerItem> _bannerItems = [
    BannerItem(id: "1", imageUrl: "https://picsum.photos/500/300"),
    BannerItem(id: "2", imageUrl: "https://picsum.photos/500/300"),
    BannerItem(id: "3", imageUrl: "https://picsum.photos/500/300"),
  ];

  Widget _getSSlider() {
    // 取当前屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: List.generate(_bannerItems.length, (int index) {
        return Image.network(
          _bannerItems[index].imageUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSSlider()]);
  }
}
