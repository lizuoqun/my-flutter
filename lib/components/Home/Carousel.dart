import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../api/home.dart';
import '../../types/home.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<BannerItem> _bannerItems = [];

  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  int _currentIndex = 0;

  void _getBannerList() async {
    _bannerItems = await getBannerListAPI();
    setState(() {});
  }

  Widget _getSSlider() {
    // 取当前屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _carouselSliderController,
      items: List.generate(_bannerItems.length, (int index) {
        return Image.network(
          _bannerItems[index].imageUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        // autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (int index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget _getDot() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 20,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_bannerItems.length, (int index) {
            return GestureDetector(
              onTap: () {
                _currentIndex = index;
                _carouselSliderController.animateToPage(index);
                setState(() {});
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _currentIndex == index ? 40 : 20,
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSSlider(), _getDot()]);
  }
}
