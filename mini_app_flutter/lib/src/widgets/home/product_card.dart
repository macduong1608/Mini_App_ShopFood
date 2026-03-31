import 'package:flutter/material.dart';

import '../../model/product_model.dart';
import '../../page/product_detail_page.dart';

Widget productCard(BuildContext context, Product product) {
  final String baseUrl = "http://192.168.86.113:5001";
  final String imageUrl = product.mainImage != null
      ? "$baseUrl${product.mainImage}"
      : "https://via.placeholder.com/150";
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(product: product),
        ),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF6600),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: const TextStyle(
            color: Color(0xFFFF6600),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
