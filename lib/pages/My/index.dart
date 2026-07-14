import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../stores/UserController.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: Center(
          child: Text(
            '${userController.userInfo.value.username}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    });
  }
}
