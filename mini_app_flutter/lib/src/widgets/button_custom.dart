import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom({
    super.key,
    required this.name,
    required this.onTap,
    required this.color,
    this.isOutlined = false,
  });

  final String name;
  final int color;
  final bool isOutlined;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mainColor = Color(color);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 65,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : mainColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isOutlined ? mainColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: isOutlined ? mainColor : Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
