import 'package:flutter/material.dart';

Widget categoryItem(BuildContext context, String label, String imageUrl) {
  return Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
    child: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFF0EDEC), width: 2),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF6600),
            ),
          ),
        ],
      ),
    ),
  );
}
