import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/model/category_model.dart';
import 'package:mini_app_flutter/src/services/category_service.dart';
import 'package:mini_app_flutter/src/services/product_service.dart';
import 'package:mini_app_flutter/src/widgets/home/product_card.dart';

import '../model/product_model.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final CategoryService categoryService = CategoryService();
  final ProductService productService = ProductService();

  int selectedTabIndex = 0;
  List<CategoryModel> categories = [];
  List<Product> products = [];
  bool isLoadingCategories = true;
  bool isLoadingProducts = false;

  @override
  void initState() {
    super.initState();
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    final fetchCategories = await categoryService.getCategoriesHome();
    print(fetchCategories);

    if (!mounted) return;
    setState(() {
      categories = fetchCategories;
      isLoadingCategories = false;
    });
    if (categories.isNotEmpty) {
      loadProductForCategory(categories[0].id);
    }
  }

  Future<void> loadProductForCategory(String categoryId) async {
    setState(() {
      isLoadingProducts = true;
    });

    final fetchedProducts = await productService.getProductByCategory(
      categoryId,
    );
    if (!mounted) return;
    setState(() {
      products = fetchedProducts;
      isLoadingProducts = false;
    });
  }

  void onTabTapped(int index) {
    if (selectedTabIndex == index) return;
    setState(() {
      selectedTabIndex = index;
    });
    loadProductForCategory(categories[index].id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              SizedBox(
                height: 45,
                child: isLoadingCategories
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.orange),
                      )
                    : categories.isEmpty
                    ? Center(child: Text("Category empty"))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return TabItem(index);
                        },
                      ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: isLoadingProducts
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.orange),
                      )
                    : products.isEmpty
                    ? Center(child: Text('Product empty'))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.55,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 24,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return productCard(context, products[index]);
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
    final category = categories[index];
    return GestureDetector(
      onTap: () {
        onTabTapped(index);
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
          category.name,
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
