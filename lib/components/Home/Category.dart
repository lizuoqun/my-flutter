import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: 50,
            color: Colors.blue,
            alignment: Alignment.center,
            margin: EdgeInsets.all(5),
            child: Text(
              "$index",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
        itemCount: 50,
      ),
    );
  }
}
