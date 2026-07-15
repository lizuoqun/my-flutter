import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/utils/TokenManager.dart';

import '../../stores/UserController.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  final UserController userController = Get.find<UserController>();

  Widget _getLogout() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('提示'),
              content: Text('确定退出登录吗？'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消'),
                ),
                TextButton(
                  onPressed: () {
                    // 把token删掉就行
                    tokenManager.removeToken();
                    Navigator.of(context).pop();
                  },
                  child: Text('确定'),
                ),
              ],
            );
          },
        );
      },
      child: Text('退出登录', style: TextStyle(fontSize: 20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(() {
            return Container(
              child: Center(
                child: Text(
                  '${userController.userInfo.value.username}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }),
          _getLogout(),
        ],
      ),
    );
  }
}
