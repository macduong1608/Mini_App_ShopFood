import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../widgets/home/bestSellerList.dart';
import '../widgets/home/categories_list.dart';
import '../widgets/home/new_arrival.dart';
import '../widgets/home/section_title.dart';

final List<Product> mockProducts = [
  Product(
    id: "1",
    name: "Grey Oversized Hoodie",
    image: "assets/product_1.png",
    price: 89.0,
    category: 'Jackets',
  ),
  Product(
    id: "2",
    name: "Technical Parka",
    image: "assets/product_2.png",
    price: 245.0,
    category: 'Jackets',
  ),
  Product(
    id: "3",
    name: "Technical Parka",
    image: "assets/product_1.png",
    price: 245.0,
    category: 'Jackets',
  ),
  Product(
    id: "4",
    name: "Technical Parka",
    image: "assets/product_2.png",
    price: 245.0,
    category: 'Jackets',
  ),
];

final List<Product> bestSellers = [
  Product(
    id: "101",
    name: "Minimalist Leather Sneaker",
    image: "assets/sneaker.png",
    price: 110.0,
    rating: 4.8,
    category: 'Jackets',
  ),
  Product(
    id: "102",
    name: "Urban Commuter Bag",
    image: "assets/bag.png",
    price: 155.0,
    rating: 5.0,
    category: 'Jackets',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: sectionTitle("Categories", showViewAll: true),
              ),
              categoriesList(),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: sectionTitle("New Arrivals", showViewAll: false),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: newArrival(context, mockProducts),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: sectionTitle("Best sellers", showViewAll: false),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: bestSellersList(bestSellers),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
