import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/services/category_service.dart';

import '../model/category_model.dart';
import '../utils/app_colors.dart';
import 'category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final CategoryService categoryService = CategoryService();
  late Future<List<CategoryModel>> categoryFuture;

  @override
  void initState() {
    super.initState();
    categoryFuture = categoryService.getCategoriesHome();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: FutureBuilder<List<CategoryModel>>(
        future: categoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Load categories error'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Categories is empty'));
          }
          final categories = snapshot.data!;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return CategoryItem(
                label: category.name.toUpperCase(),
                imageUrl: category.fullImageUrl,
                isNetworkImage: true,
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
