import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/router/index.dart';
import 'package:my_flutter/stores/UserController.dart';

void main() {
  Get.put(UserController());
  runApp(getRootWidget());
}
