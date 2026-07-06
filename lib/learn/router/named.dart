import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        // '/detail': (context) => DetailPage(),
      },
      onGenerateRoute: (settings) {
        var doubleValue = Random().nextDouble();
        print('settings.name: ${settings.name}, doubleValue: $doubleValue');
        if (settings.name == '/detail') {
          bool isLogin = doubleValue > 0.5;
          if (isLogin) {
            return MaterialPageRoute(builder: (context) => DetailPage());
          } else {
            return MaterialPageRoute(builder: (context) => MainPage());
          }
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFound());
      },
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Named Routing 命名路由'))),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('点击了--索引--$index');
              Navigator.pushNamed(context, '/detail', arguments: index);
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
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int? _index;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _index = ModalRoute.of(context)?.settings.arguments as int?;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('返回'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notFound');
            },
            child: Text('跳转404页面'),
          ),
          Text(
            'Detail Page 详情页，索引为 $_index',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('404 Not Found'));
  }
}
