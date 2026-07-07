import 'package:my_flutter/constant/index.dart';
import 'package:my_flutter/utils/DioRequers.dart';

import '../types/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return (await dioRequest.get(ApiConstants.BANNER_URL) as List).map((item) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async {
  return (await dioRequest.get(ApiConstants.CATEGORY_URL) as List).map((item) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<GoodsResult> getGoodsListAPI() async {
  return GoodsResult.fromJson(await dioRequest.get(ApiConstants.HOT_URL));
}
