import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/model/product_model.dart';
import 'package:mini_app_flutter/src/widgets/home/product_card.dart';

Widget newArrival(BuildContext context, List<Product> products) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
    ),
    itemBuilder: (context, index) {
      return productCard(context, products[index]);
    },
  );
}
