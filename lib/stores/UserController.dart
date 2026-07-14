import 'package:get/get.dart';

import '../types/user.dart';

class UserController extends GetxController {
  var userInfo = UserInfo().obs;

  updateUserInfo(UserInfo userInfo) {
    this.userInfo.value = userInfo;
  }
}
