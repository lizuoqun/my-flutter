import 'package:flutter/material.dart';

void main() {
  runApp(MyAlign());
}

class MyAlign extends StatelessWidget {
  const MyAlign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Align示例"))),
        body: Container(
          color: Colors.red,
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.blue,
            child: Padding(
              // padding: EdgeInsets.all(20),
              // padding: EdgeInsets.only(
              //   left: 20,
              //   top: 20,
              //   right: 20,
              //   bottom: 20,
              // ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: 2,
                heightFactor: 3,
                child: Icon(Icons.star, size: 100, color: Colors.yellow),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
