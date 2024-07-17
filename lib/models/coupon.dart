class Coupon {
  final String id;
  final DateTime expiryDate;
  final List stores;
  final bool isStarred;
  final String? description;
  final String imageUrl;

  Coupon({
    required this.id,
    required this.expiryDate,
    required this.stores,
    required this.isStarred,
    required this.imageUrl,
    this.description,
  });

  static Coupon fromJSON(Map<String, dynamic> json) {
    return Coupon(
      id: json["id"],
      expiryDate: json["expiry_date"].toDate(),
      stores: json["stores"],
      isStarred: json["is_starred"],
      imageUrl: json["image_url"],
      description: json["description"],
    );
  }
}
