import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool showViewAll;
  final VoidCallback? onViewAll;

  const SectionTitle({
    super.key,
    required this.title,
    this.showViewAll = false,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
          ),
        ),
        if (showViewAll)
          GestureDetector(
            onTap: onViewAll,
            child: const Text(
              "View All",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
