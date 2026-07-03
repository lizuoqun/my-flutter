import 'package:flutter/material.dart';

void main() {
  runApp(MyText());
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Text示例"))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "江畔何人初见月，江月何年初照人？江畔何人初见月，江月何年初照人？江畔何人初见月，江月何年初照人？江畔何人初见月，江月何年初照人？",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                ),
                // 文本超长设置
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              // 富文本
              Text.rich(
                TextSpan(
                  text: "Hello ",
                  style: TextStyle(fontSize: 36, color: Colors.red),
                  children: [
                    TextSpan(
                      text: "Flutter",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
