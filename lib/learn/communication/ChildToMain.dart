import 'package:flutter/material.dart';

void main() {
  runApp(Area());
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("子传父"))),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(_list.length, (index) {
            return Block(
              name: _list[index],
              index: index,
              callback: (index) {
                print('点击了--索引--$index');
                setState(() {
                  _list.removeAt(index);
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class Block extends StatefulWidget {
  final String name;
  final int index;
  final Function(int index) callback;

  const Block({
    super.key,
    required this.name,
    required this.index,
    required this.callback,
  });

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            "姓名：${widget.name}",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        IconButton(
          color: Colors.black,
          onPressed: () {
            print('删除--索引--${widget.index}');
            widget.callback(widget.index);
          },
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}
