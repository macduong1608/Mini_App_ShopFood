import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/services/product_service.dart';

import '../model/product_model.dart';
import '../utils/app_colors.dart';
import 'bestSellerItem.dart';

class Bestsellerlist extends StatefulWidget {
  const Bestsellerlist({super.key});

  @override
  State<Bestsellerlist> createState() => _BestsellerlistState();
}

class _BestsellerlistState extends State<Bestsellerlist> {
  final ProductService productService = ProductService();
  late Future<List<Product>> bestSellersFuture;

  @override
  void initState() {
    super.initState();
    bestSellersFuture = productService.getBestSellers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: bestSellersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text("Có lỗi khi tải Best Sellers."));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Chưa có sản phẩm Best Seller."));
        }

        final products = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return BestSellerItem(product: products[index]);
          },
        );
      },
    );
  }
}
