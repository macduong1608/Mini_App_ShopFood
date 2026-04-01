import '../utils/app_constants.dart';

class CategoryModel {
  final String id;
  final String name;
  final String? slug;
  final String? imageUrl;
  final int? sortOrder;

  CategoryModel({
    required this.id,
    required this.name,
    this.slug,
    this.imageUrl,
    this.sortOrder,
  });

  String get fullImageUrl => (imageUrl != null && imageUrl!.isNotEmpty)
      ? "${AppConstants.baseUrl}$imageUrl"
      : AppConstants.placeholderImage;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'],
      imageUrl: json['imageUrl'],
      sortOrder: json['sortOrder'],
    );
  }
}
