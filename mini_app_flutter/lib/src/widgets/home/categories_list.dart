import 'package:flutter/material.dart';

import 'category_item.dart';

class categoriesList extends StatelessWidget {
  const categoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          categoryItem(context, 'MEN', "assets/cate_1.png"),
          categoryItem(context, 'WOMEN', "assets/cate_2.png"),
          categoryItem(context, 'ACCESSORIES', "assets/cate_3.png"),
          categoryItem(context, 'JACKET', "assets/cate_1.png"),
          categoryItem(context, 'VEST', "assets/cate_2.png"),
        ],
      ),
    );
  }
}
