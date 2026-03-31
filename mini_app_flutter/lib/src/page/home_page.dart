import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/widgets/home/bestSellerList.dart';

import '../widgets/home/categories_list.dart';
import '../widgets/home/new_arrival.dart';
import '../widgets/home/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: sectionTitle("Categories", showViewAll: true),
              ),
              categoriesList(),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: sectionTitle("New Arrivals", showViewAll: false),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: NewArrivalSection(),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: sectionTitle("Best sellers", showViewAll: false),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Bestsellerlist(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
