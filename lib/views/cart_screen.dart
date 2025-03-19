

// Cart Screen
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giỏ hàng')),
      body: const Center(child: Text('Danh sách sản phẩm trong giỏ hàng', style: TextStyle(fontSize: 18))),
    );
  }
}
