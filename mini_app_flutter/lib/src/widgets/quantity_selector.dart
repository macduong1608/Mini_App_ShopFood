import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove, size: 16, color: Colors.black),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 40),
          ),
          Text(
            "$quantity",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add, size: 16, color: Colors.black),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 40),
          ),
        ],
      ),
    );
  }
}
