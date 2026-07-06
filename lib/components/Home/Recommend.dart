import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  const Recommend({super.key});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "Recommend",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
