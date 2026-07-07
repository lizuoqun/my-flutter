import 'package:my_flutter/constant/index.dart';
import 'package:my_flutter/utils/DioRequers.dart';

import '../types/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return (await dioRequest.get(ApiConstants.BANNER_URL) as List).map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}
