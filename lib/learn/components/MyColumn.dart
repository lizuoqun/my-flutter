import 'package:flutter/material.dart';

void main() {
  runApp(MyColumn());
}

class MyColumn extends StatelessWidget {
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Column示例"))),
        body: Container(
          color: Colors.amber,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.center,

            // crossAxisAlignment: CrossAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 100, height: 100, color: Colors.yellow),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              SizedBox(height: 10),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
