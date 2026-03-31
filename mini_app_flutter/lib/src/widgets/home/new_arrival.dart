import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/services/product_service.dart';
import 'package:mini_app_flutter/src/widgets/home/product_card.dart';

import '../../model/product_model.dart';

class NewArrivalSection extends StatefulWidget {
  const NewArrivalSection({super.key});

  @override
  State<NewArrivalSection> createState() => _NewArrivalSectionState();
}

class _NewArrivalSectionState extends State<NewArrivalSection> {
  final ProductService productService = ProductService();
  late Future<List<Product>> newArrivalsFuture;
  @override
  void initState() {
    super.initState();
    newArrivalsFuture = productService.getNewArrivals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: newArrivalsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(color: Colors.orange),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text("Có lỗi khi tải sản phẩm."));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Chưa có sản phẩm mới."));
        }

        final products = snapshot.data!;
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return productCard(context, products[index]);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        );
      },
    );
  }
}
