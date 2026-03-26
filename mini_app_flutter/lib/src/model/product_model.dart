class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final double rating;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.rating = 5.0,
    required this.category,
  });
}
