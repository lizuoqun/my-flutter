class BannerItem {
  String imageUrl;
  String id;

  BannerItem({required this.imageUrl, required this.id});

  // 扩展一个工厂
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(imageUrl: json['imgUrl'], id: json['id']);
  }
}
