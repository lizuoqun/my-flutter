import 'package:flutter/material.dart';

void main() {
  runApp(MyCounter());
}

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                child: Text('-'),
              ),
              Text(count.toString()),
              TextButton(
                onPressed: () {
                  count++;
                  // 调用setState方法，重新执行build方法，页面进行更新
                  setState(() {});
                },
                child: Text('+'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
