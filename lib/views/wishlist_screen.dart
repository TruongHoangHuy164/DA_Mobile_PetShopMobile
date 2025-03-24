import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: const Text("Danh sách yêu thích")),
      body: const Center(child: Text("Danh sách sản phẩm yêu thích")),
    );
  }
}
