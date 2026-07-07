import 'package:flutter/material.dart';
import 'package:my_flutter/types/home.dart';

import '../../api/home.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategoryItem> _categoryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategoryList();
  }

  _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          final category = _categoryList[index];
          return Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(100000),
            ),
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  category.picture,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                Text(
                  category.name,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          );
        },
        itemCount: _categoryList.length,
      ),
    );
  }
}
