import 'package:flutter/material.dart';

Widget inputFiledCustom(String label, String hint, {bool isPassword = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Color(0xFF9C8D86),
        ),
      ),
      const SizedBox(height: 10),
      TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF8D8D8D), fontSize: 16),
          filled: true,
          fillColor: Color(0xFFE5E2E1),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none,
          ),
          suffixIcon: isPassword
              ? Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                  size: 20,
                )
              : null,
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
