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
  Container getContainer(int index) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        "列表项第${index + 1}个",
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
        appBar: AppBar(title: Center(child: Text("CustomScrollView滚动"))),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "轮播图",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverPersistentHeader(delegate: _StickyCategory(), pinned: true),
            // SliverList.separated(
            //   itemCount: 100,
            //   itemBuilder: (BuildContext text, int index) {
            //     return getContainer(index);
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
