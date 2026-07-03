import 'package:flutter/material.dart';

void main() {
  runApp(MySingleChildScrollView());
}

class MySingleChildScrollView extends StatefulWidget {
  const MySingleChildScrollView({super.key});

  @override
  State<MySingleChildScrollView> createState() => _MySingleChildScrollViewState();
}

class _MySingleChildScrollViewState extends State<MySingleChildScrollView> {
  ScrollController _scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("SingleChildScrollView滚动"))),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.all(10),
              child: Column(spacing: 10, children: getList()),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  print("去底部");
                  // _scrollController.jumpTo(
                  //   _scrollController.position.maxScrollExtent,
                  // );
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "去底部",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: GestureDetector(
                onTap: () {
                  print("去顶部");
                  _scrollController.jumpTo(0);
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "去顶部",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
