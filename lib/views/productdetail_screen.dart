import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/dashboard'), // Quay lại dashboard
        ),
        title: Text('Chi tiết sản phẩm $id'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/pet_$id.jpg', fit: BoxFit.cover, width: double.infinity, height: 300),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sản phẩm $id', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text('Giá: 500.000 VND', style: TextStyle(fontSize: 20, color: Colors.red)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Thêm vào giỏ hàng'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
