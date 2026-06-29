import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      // home: MyStatelessWidget(),
      home: MyStatefulWidget(),
    ),
  );
}

// 无状态组件
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyStatelessWidget')),
      body: Container(child: Center(child: Text('无状态组件'))),
      bottomNavigationBar: Container(
        height: 80,
        child: Center(child: Text('底部导航栏')),
      ),
    );
  }
}

// 有状态组件
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState((){
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyStatefulWidget')),
      body: Center(child: Text('有状态组件$_counter')),
      floatingActionButton: FloatingActionButton(onPressed: _incrementCounter),
    );
  }
}
