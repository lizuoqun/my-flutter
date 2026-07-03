import 'package:flutter/material.dart';

void main() {
  runApp(MyFlex());
}

class MyFlex extends StatelessWidget {
  const MyFlex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Flex示例"))),
        body: Container(
          color: Colors.amber,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 2,
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Expanded(
                flex: 1,
                child: Container(width: 100, height: 100, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
