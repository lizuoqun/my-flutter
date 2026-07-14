import 'package:flutter/material.dart';

class MessageUtils {
  static bool showLoading = false;

  static void showMessage(BuildContext context, String message) {
    if (MessageUtils.showLoading) {
      return;
    }
    MessageUtils.showLoading = true;
    Future.delayed(Duration(seconds: 3), () {
      MessageUtils.showLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        content: Text(message ?? '加载成功', textAlign: TextAlign.center),
      ),
    );
  }
}
