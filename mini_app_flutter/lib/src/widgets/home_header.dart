import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "SD",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search fashion...',
                prefixIcon: Icon(Icons.search, color: Color(0xFF5A4136)),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                size: 29,
                color: AppColors.secondary,
              ),
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
