import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/utils/app_colors.dart';
import 'package:mini_app_flutter/src/widgets/button_custom.dart';
import 'package:mini_app_flutter/src/widgets/quantity_selector.dart';

import '../model/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  final int quantity;
  const ProductDetailPage({
    super.key,
    required this.product,
    this.quantity = 1,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = 'M';
  int selectedColorIndex = 0;
  late int currentQuantity;

  final List<String> sizes = ['S', 'M', 'L', 'XL'];
  final List<Color> colors = [
    AppColors.primary,
    AppColors.secondary,
    const Color(0xFFD2B48C),
  ];

  @override
  void initState() {
    super.initState();
    currentQuantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'SD',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag, color: AppColors.secondary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.fullImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "\$${widget.product.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Crafted from premium European flax, this blazer offers a relaxed yet refined silhouette. Perfect for layering during transitional seasons, featuring hand-finished seams and a breathable viscose lining.",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textGrey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "QUANTITY",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textLight,
                      letterSpacing: 1.2,
                    ),
                  ),
                  QuantitySelector(
                    quantity: currentQuantity,
                    onIncrement: () => setState(() => currentQuantity++),
                    onDecrement: () {
                      if (currentQuantity > 1) {
                        setState(() => currentQuantity--);
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "SELECT SIZE",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textLight,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: sizes.map((size) {
                  bool isSelected = selectedSize == size;
                  return GestureDetector(
                    onTap: () => setState(() => selectedSize = size),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? AppColors.secondary
                            : AppColors.background,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.secondary
                              : Colors.grey.shade300,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        size,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.background
                              : AppColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 15),
              const Text(
                "COLOR",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textLight,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: List.generate(colors.length, (index) {
                  bool isSelected = selectedColorIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() {
                      selectedColorIndex = index;
                    }),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.secondary
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: colors[index],
                        radius: 14,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ButtonCustom(
                      name: 'Add to Bag',
                      onTap: () {},
                      color: AppColors.primary.value,
                    ),
                    const SizedBox(height: 12),
                    ButtonCustom(
                      name: 'Buy Now',
                      onTap: () {},
                      color: AppColors.primary.value,
                      isOutlined: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
