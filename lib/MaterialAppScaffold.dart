import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('标题')),
        body: Container(child: Center(child: Text('Hello World'))),
        bottomNavigationBar: Container(
          height: 80,
          child: Center(child: Text('底部导航栏')),
        ),
      ),
    ),
  );
}
