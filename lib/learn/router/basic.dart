import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Basic Routing 基础路由'))),
        body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('点击了--索引--$index');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(index: index),
                  ),
                );
              },
              child: Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.blue,
                margin: EdgeInsets.all(5),
                child: Text(
                  'Item $index',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Detail Page 详情页'))),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('返回'),
              ),
              Text(
                'Detail Page 详情页 -- ${widget.index}',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
