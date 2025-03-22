import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              context.go('/dashboard'); // Điều hướng về dashboard nếu không thể pop
            }
          },
        ),
        title: const Text('Giỏ hàng'),
      ),
      body: const Center(
        child: Text('Danh sách sản phẩm trong giỏ hàng', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
