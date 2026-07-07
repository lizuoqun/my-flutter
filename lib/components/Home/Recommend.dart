import 'package:flutter/material.dart';

import '../../api/home.dart';
import '../../types/home.dart';

class Recommend extends StatefulWidget {
  const Recommend({super.key});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  GoodsResult _goodsResult = GoodsResult(id: '', title: "", subTypes: []);

  List<GoodsItem> _getDisplayItems(int count) {
    return _goodsResult.subTypes.first.goodsItems.items.take(count).toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Text("精选", style: TextStyle(color: Colors.red, fontSize: 16)),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/images/default.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _buildRight() {
    List<GoodsItem> _list = _getDisplayItems(5);
    return List.generate(_list.length, (int index) {
      return Column(
        children: [
          ClipRRect(
            child: Image.network(
              _list[index].picture,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "lib/assets/images/default.png",
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red,
            ),
            child: Text(
              "￥${_list[index].price}",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHotList();
  }

  void _getHotList() async {
    _goodsResult = await getGoodsListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("lib/assets/images/person.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            Row(
              children: [
                _buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildRight(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
