import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/widgets/home/product_card.dart';

import '../model/product_model.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int selectedTabIndex = 0;
  List<String> categories = ["All", "T-Shirts", "Jackets", "Jeans", "Dresses"];
  final List<Product> mockProducts = [
    Product(
      id: '1',
      name: 'Tailored Linen Blazer',
      price: 189.00,
      image: "assets/product_1.png",
      category: 'Jackets',
    ),
    Product(
      id: '2',
      name: 'Evening Silk Gown',
      price: 245.00,
      image: "assets/product_2.png",
      category: 'T-Shirts',
    ),
    Product(
      id: '3',
      name: 'Essential White Shirt',
      price: 79.00,
      image: "assets/product_3.png",
      category: 'T-Shirts',
    ),
    Product(
      id: '4',
      name: 'Raw Indigo Denim',
      price: 120.00,
      image: "assets/product_2.png",
      category: 'Jeans',
    ),
    Product(
      id: '5',
      name: 'Structured Wool Coat',
      price: 310.00,
      image: "assets/product_2.png",
      category: 'Jackets',
    ),
    Product(
      id: '6',
      name: 'Heritage Leather Boot',
      price: 195.00,
      image: "assets/product_2.png",
      category: 'Jeans',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String currentCategory = categories[selectedTabIndex];
    List<Product> filteredProducts = currentCategory == "All"
        ? mockProducts
        : mockProducts.where((p) => p.category == currentCategory).toList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return TabItem(index);
                  },
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return productCard(context, filteredProducts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget TabItem(int index) {
    bool isSelected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 8,
          right: index == categories.length - 1 ? 16 : 0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFF6600) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF6600) : Colors.grey.shade300,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          categories[index],
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
