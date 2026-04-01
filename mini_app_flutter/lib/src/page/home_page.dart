import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/bestSellerList.dart';
import '../widgets/categories_list.dart';
import '../widgets/new_arrival.dart';
import '../widgets/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SectionTitle(title: "Categories", showViewAll: true),
              ),
              const CategoriesList(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SectionTitle(title: "New Arrivals", showViewAll: false),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: NewArrivalSection(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SectionTitle(title: "Best Sellers", showViewAll: false),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Bestsellerlist(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
