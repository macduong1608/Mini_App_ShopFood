import 'package:flutter/material.dart';

Widget sectionTitle(String title, {bool showViewAll = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      if (showViewAll)
        const Text(
          "View All",
          style: TextStyle(
            color: Color(0xFFFF6600),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
    ],
  );
}
