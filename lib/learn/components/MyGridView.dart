import 'package:flutter/material.dart';

void main() {
  runApp(MyGridView());
}

class MyGridView extends StatefulWidget {
  const MyGridView({super.key});

  @override
  State<MyGridView> createState() => _MyGridView();
}

class _MyGridView extends State<MyGridView> {
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
        "第${index + 1}个",
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
        appBar: AppBar(title: Center(child: Text("GridView滚动"))),

        // body: GridView.count(
        //   padding: EdgeInsets.all(10),
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   scrollDirection: Axis.vertical,
        //   crossAxisCount: 3,
        //   children: getList(),
        // ),

        // 计算【maxCrossAxisExtent:200】
        // 如果屏幕宽度是 400px ，会显示 2 列 （400 ÷ 200 = 2）
        // 如果屏幕宽度是 500px ，会显示 2 列 （500 ÷ 200 = 2.5，向下取整）
        // 如果屏幕宽度是 600px ，会显示 3 列 （600 ÷ 200 = 3）

        // body: GridView.extent(
        //   padding: EdgeInsets.all(10),
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   // 网格项在 交叉轴 方向上的 最大宽度
        //   maxCrossAxisExtent: 200,
        //   children: getList(),
        // ),
        body: GridView.builder(
          // 布局委托
          // SliverGridDelegateWithMaxCrossAxisExtent + maxCrossAxisExtent
          // SliverGridDelegateWithFixedCrossAxisCount + crossAxisCount
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2, // 宽高比
          ),
          itemBuilder: (BuildContext context, int index) {
            return getContainer(index);
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
