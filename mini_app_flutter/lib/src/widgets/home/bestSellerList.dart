import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/services/product_service.dart';
import 'package:mini_app_flutter/src/widgets/home/bestSellerItem.dart';

import '../../model/product_model.dart';

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
    return FutureBuilder(
      future: bestSellersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CircularProgressIndicator(color: Colors.orange),
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
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return bestSellerItem(products[index]);
          },
        );
      },
    );
  }
}
