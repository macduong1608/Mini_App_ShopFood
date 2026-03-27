import 'package:flutter/material.dart';
import 'package:mini_app_flutter/src/widgets/button_custom.dart';

import '../model/cart_model.dart';
import 'order_success_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isCheckoutSuccess = false;

  List<CartItem> cartItems = [
    CartItem(
      id: '1',
      name: 'Tailored Linen\nBlazer',
      image: 'assets/product_2.png',
      size: '42',
      color: 'Oatmeal',
      price: 380.00,
      quantity: 1,
    ),
    CartItem(
      id: '2',
      name: 'Silk Pleated\nTrousers',
      image: 'assets/product_1.png',
      size: '40',
      color: 'Noir',
      price: 245.00,
      quantity: 1,
    ),
  ];

  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    if (isCheckoutSuccess) {
      return OrderSuccessPage(
        onContinueShopping: () {
          setState(() {
            isCheckoutSuccess = false;
            cartItems.clear();
          });
        },
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Cart",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "${cartItems.length} Items in your editorial selection",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 10),
              ...cartItems.map((item) => cartItem(item)).toList(),
              SizedBox(height: 10),
              Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Promotion code",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 24,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        "APPLY",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        Text(
                          "\$${subtotal.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        Text(
                          "Free",
                          style: TextStyle(
                            color: Color(0xFFC48B71),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(color: Colors.black12, thickness: 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "\$${subtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Color(0xFFFF6600),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: ButtonCustom(
                  name: "Proceed to Checkout",
                  onTap: () {
                    setState(() {
                      isCheckoutSuccess = true;
                    });
                  },
                  color: 0xFFFF6600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cartItem(CartItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          height: 1.2,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cartItems.remove(item);
                        });
                      },
                      child: Icon(Icons.close, color: Colors.grey, size: 20),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  "Size: ${item.size} | Color: ${item.color}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (item.quantity > 1) {
                                setState(() {
                                  item.quantity--;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 14,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(minWidth: 35),
                          ),
                          Text(
                            "${item.quantity}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                item.quantity++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              size: 14,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(minWidth: 35),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Color(0xFFFF6600),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
