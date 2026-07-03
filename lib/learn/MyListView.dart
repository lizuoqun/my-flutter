import 'package:flutter/material.dart';

void main() {
  runApp(MyListView());
}

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListView();
}

class _MyListView extends State<MyListView> {
  // 直接生成100个Container
  List<Widget> getList() {
    return List.generate(100, (index) {
      return Container(
        width: double.infinity,
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
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
      margin: EdgeInsets.all(5),
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
        appBar: AppBar(title: Center(child: Text("ListView滚动"))),

        // 默认加载
        // body: ListView(padding: EdgeInsets.all(10), children: getList()),
        // 使用ListView.builder，【虚拟列表】
        // body: ListView.builder(
        //   itemCount: 100,
        //   padding: EdgeInsets.all(10),
        //   itemBuilder: (BuildContext context, int index) {
        //     return getContainer(index);
        //   },
        // ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return getContainer(index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return getSeparatorContainer(index);
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
