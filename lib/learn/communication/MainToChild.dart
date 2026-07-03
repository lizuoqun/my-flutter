import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("父传子"))),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("父组件", style: TextStyle(fontSize: 24, color: Colors.red)),
              Child(name: "张三"),
              ChildState(age: 18),
              Area(),
            ],
          ),
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  final String? name;

  const Child({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "无状态子组件----姓名：$name",
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }
}

class ChildState extends StatefulWidget {
  final int age;

  // 通过required关键字，强制子组件必须传入参数age
  const ChildState({super.key, required this.age});

  @override
  State<ChildState> createState() => _ChildStateState();
}

class _ChildStateState extends State<ChildState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "有状态子组件----年龄：${widget.age}",
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }
}

class Area extends StatefulWidget {
  const Area({super.key});

  @override
  State<Area> createState() => _AreaState();
}

class _AreaState extends State<Area> {
  final List<String> _list = ["张三", "李四", "王五", "赵六", "孙七", "周八", "吴九", "郑十"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,

      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(_list.length, (index) {
          return Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Block(name: _list[index]),
          );
        }),
      ),
    );
  }
}

class Block extends StatefulWidget {
  final String name;

  const Block({super.key, required this.name});

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "姓名：${widget.name}",
      style: TextStyle(fontSize: 20, color: Colors.blue),
    );
  }
}
