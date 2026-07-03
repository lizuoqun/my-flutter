import 'package:flutter/material.dart';

void main() {
  runApp(MyCenter());
}

class MyCenter extends StatelessWidget {
  const MyCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Center示例"))),
        body: Center(
          child: Container(
            // alignment: Alignment.center,
            width: 400,
            height: 400,
            color: Colors.red,
            child: Center(
              child: Text(
                "Center示例",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
