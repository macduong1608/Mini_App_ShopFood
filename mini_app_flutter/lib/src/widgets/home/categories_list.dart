import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/services/category_service.dart';
import 'package:mini_app_flutter/src/widgets/home/category_item.dart';

import '../../model/category_model.dart';

class categoriesList extends StatefulWidget {
  const categoriesList({super.key});

  @override
  State<categoriesList> createState() => _categoriesListState();
}

class _categoriesListState extends State<categoriesList> {
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
              child: CircularProgressIndicator(color: Colors.orange),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Load categories error'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Categories is emty'));
          }
          final categories = snapshot.data!;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              String fallbackImage = "assets/cate_${(index % 3) + 1}.png";
              bool hasRealImage =
                  category.imageUrl != null && category.imageUrl!.isNotEmpty;
              return categoryItem(
                context,
                category.name.toUpperCase(),
                hasRealImage ? category.imageUrl! : fallbackImage,
                isNetworkImage: hasRealImage,
              );
            },
          );
        },
      ),
    );
  }
}
