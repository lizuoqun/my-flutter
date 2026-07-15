import 'package:flutter/material.dart';
import 'package:my_flutter/components/Home/MoreList.dart';

import '../../components/Home/Carousel.dart';
import '../../components/Home/Category.dart';
import '../../components/Home/Hot.dart';
import '../../components/Home/Recommend.dart';
import '../../utils/Message.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getSlivers() {
    return [
      SliverToBoxAdapter(child: Carousel()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: Category()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: Recommend()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hot()),
              SizedBox(width: 10),
              Expanded(child: Hot()),
            ],
          ),
        ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      MoreList(),
    ];
  }

  // GlobalKey
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  double _paddingTop = 0;

  @override
  void initState() {
    super.initState();
    // initState -> build ->
    Future.microtask(() {
      setState(() {
        _paddingTop = 100;
      });
      _refreshIndicatorKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        print('下拉刷新');
        MessageUtils.showMessage(context, '刷新成功');
        setState(() {
          _paddingTop = 0;
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(seconds: 2),
        child: CustomScrollView(slivers: _getSlivers()),
      ),
    );
  }
}
