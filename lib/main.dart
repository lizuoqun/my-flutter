import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('MyStatelessWidget')),
        body: Container(
          child: Center(
            child: TextButton(
              onPressed: () {
                print('按钮的点击事件？');
              },
              child: Text('按钮'),
            ),

            // child: GestureDetector(
            //   onTap: () {
            //     print('触发了点击事件？');
            //   },
            //   onDoubleTap: () {
            //     print('触发了双击事件？');
            //   },
            //   child: Text('点击'),
            // ),
          ),
        ),
      ),
    ),
  );
}
