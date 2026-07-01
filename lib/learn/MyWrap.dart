import 'package:flutter/material.dart';

void main() {
  runApp(MyWrap());
}

class MyWrap extends StatelessWidget {
  const MyWrap({super.key});

  List<Widget> getList() {
    return List.generate(10, (index) {
      return Container(width: 100, height: 100, color: Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Wrap示例"))),
        body: Container(
          color: Colors.amber,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: getList(),
          ),
        ),
      ),
    );
  }
}
