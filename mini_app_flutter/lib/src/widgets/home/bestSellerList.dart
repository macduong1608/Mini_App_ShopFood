import 'package:flutter/material.dart';

import '../../model/product_model.dart';
import 'bestSellerItem.dart';

Widget bestSellersList(List<Product> products) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: products.length,
    itemBuilder: (context, index) {
      return bestSellerItem(products[index]);
    },
  );
}
