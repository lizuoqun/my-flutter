import 'package:flutter/material.dart';

void main() {
  runApp(MyCustomScrollView());
}

class MyCustomScrollView extends StatefulWidget {
  const MyCustomScrollView({super.key});

  @override
  State<MyCustomScrollView> createState() => _MyCustomScrollView();
}

class _MyCustomScrollView extends State<MyCustomScrollView> {
  PageController _pageController = PageController(); // pageView控制器
  int _currentIndex = 0; // 当前索引

  // 直接生成100个Container
  List<Widget> getList() {
    return List.generate(100, (index) {
      return Container(
        width: double.infinity,
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "第${index + 1}个",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
    });
  }

  // 生成一个Container
  Container getContainer(int index, String title) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        "$title第${index + 1}个",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  // 生成一个分隔线
  Container getSeparatorContainer(int index) {
    return Container(width: double.infinity, height: 10, color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("CustomScrollView+PageView滚动")),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    child: PageView.builder(
                      controller: _pageController,
                      itemBuilder: (BuildContext context, int index) {
                        return getContainer(index, "轮播图");
                      },
                      itemCount: 20,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    // child: Container(color: Colors.red,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        10,
                            (index) => GestureDetector(
                          onTap: () {
                            print('点击索引----$index');
                            // _pageController.jumpToPage(index);
                            _pageController.animateToPage(
                              index,
                              duration: Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                            // _pageController.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.ease);
                            // _pageController.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.easeIn);
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? Colors.red
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverPersistentHeader(delegate: _StickyCategory(), pinned: true),
            // SliverList.separated(
            //   itemCount: 100,
            //   itemBuilder: (BuildContext text, int index) {
            //     return getContainer(index, "列表项");
            //   },
            //   separatorBuilder: (BuildContext text, int index) {
            //     return getSeparatorContainer(index);
            //   },
            // ),
            SliverGrid.extent(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              maxCrossAxisExtent: 100,
              children: getList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyCategory extends SliverPersistentHeaderDelegate {
  // 生成一个Container
  Container getContainer(int index) {
    return Container(
      width: 100,
      color: Colors.blue,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      child: Text(
        "第${index + 1}个",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return getContainer(index);
        },
      ),
    );
  }

  // 最大展开高度（默认展示高度）
  @override
  double get maxExtent => 100;

  // 最小折叠高度（吸顶后高度）
  @override
  double get minExtent => 50;

  // 是否需要重新构建
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
