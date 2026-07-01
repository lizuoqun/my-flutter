import 'package:flutter/material.dart';

void main() {
  runApp(MyStack());
}

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  List<Widget> getList() {
    return List.generate(10, (index) {
      return Container(width: 100, height: 100, color: Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Stack示例"))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.yellow,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.blue),
              Container(width: 100, height: 100, color: Colors.red),
              Container(width: 50, height: 50, color: Colors.yellow),
              Container(width: 25, height: 25, color: Colors.green),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Positioned(
                // 四个边距都为0，则拉伸为父容器宽高
                top: 0,
                bottom: 0,
                // left: 0,
                // right: 0,
                child: Container(width: 100, height: 100, color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
