import '../utils/app_constants.dart';

class Product {
  final String id;
  final String name;
  final String slug;
  final double price;
  final double originalPrice;
  final double discountPercent;
  final String? mainImage;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.originalPrice,
    required this.discountPercent,
    this.mainImage,
  });

  String get fullImageUrl => mainImage != null
      ? "${AppConstants.baseUrl}$mainImage"
      : AppConstants.placeholderImage;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      originalPrice: (json['originalPrice'] ?? 0).toDouble(),
      discountPercent: (json['discountPercent'] ?? 0).toDouble(),
      mainImage: json['mainImage'],
    );
  }
}
