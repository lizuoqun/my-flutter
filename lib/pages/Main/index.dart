import 'package:flutter/material.dart';

import '../Category/index.dart';
import '../Home/index.dart';
import '../My/index.dart';
import '../Shop/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      'title': '首页',
      'icon': 'lib/assets/images/home.webp',
      'activeIcon': 'lib/assets/images/home_active.webp',
    },
    {
      'title': '分类',
      'icon': 'lib/assets/images/classification.webp',
      'activeIcon': 'lib/assets/images/classification_active.webp',
    },
    {
      'title': '购物车',
      'icon': 'lib/assets/images/shop.webp',
      'activeIcon': 'lib/assets/images/shop_active.webp',
    },
    {
      'title': '我的',
      'icon': 'lib/assets/images/my.webp',
      'activeIcon': 'lib/assets/images/my_active.webp',
    },
  ];
  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]['icon']!, width: 24, height: 24),
        activeIcon: Image.asset(
          _tabList[index]['activeIcon']!,
          width: 24,
          height: 24,
        ),
        label: _tabList[index]['title'],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), ShopView(), MyView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: _getBottomNavigationBarItems(),
      ),
    );
  }
}
