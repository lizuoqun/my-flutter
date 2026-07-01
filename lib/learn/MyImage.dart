import 'package:flutter/material.dart';

void main() {
  runApp(MyImage());
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Image示例"))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text("asset本地图片"),
              Image.asset(
                "lib/images/person.webp",
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              ),
              Text("network网络图片"),
              Image.network(
                "https://oss.irim.online/eim/file/PIC_PKG_8856_8854_1782380147.jpg",
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
