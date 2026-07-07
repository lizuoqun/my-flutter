class BannerItem {
  String imageUrl;
  String id;

  BannerItem({required this.imageUrl, required this.id});

  // 扩展一个工厂
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(imageUrl: json['imgUrl'], id: json['id']);
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  // 扩展一个工厂
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      children: json['children'] != null
          ? (json['children'] as List)
                .map((e) => CategoryItem.fromJson(e))
                .toList()
          : null,
    );
  }
}

class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      price: json['price'],
      picture: json['picture'],
      orderNum: json['orderNum'],
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'],
      pageSize: json['pageSize'],
      pages: json['pages'],
      page: json['page'],
      items: (json['items'] as List).map((e) => GoodsItem.fromJson(e)).toList(),
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'],
      title: json['title'],
      goodsItems: GoodsItems.fromJson(json['goodsItems']),
    );
  }
}

class GoodsResult {
  String id;
  String title;
  List<SubType> subTypes;

  GoodsResult({required this.id, required this.title, required this.subTypes});

  factory GoodsResult.fromJson(Map<String, dynamic> json) {
    return GoodsResult(
      id: json['id'],
      title: json['title'],
      subTypes: (json['subTypes'] as List)
          .map((e) => SubType.fromJson(e))
          .toList(),
    );
  }
}
