import 'package:flutter/material.dart';

void main() {
  runApp(MyContainer());
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(16),
          width: 200,
          height: 200,
          transform: Matrix4.rotationZ(0.05),
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Hello World",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}