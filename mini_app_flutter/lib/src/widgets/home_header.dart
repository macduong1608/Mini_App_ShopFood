import 'package:flutter/material.dart';

class homeHeader extends StatelessWidget {
  const homeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "SD",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFE5E2E1),
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
              Icon(
                Icons.shopping_bag_outlined,
                size: 29,
                color: Color(0xFF1C1B1B),
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
