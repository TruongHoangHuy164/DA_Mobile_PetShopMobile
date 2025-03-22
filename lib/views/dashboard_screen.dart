import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

import 'cart_screen.dart';
import 'home_screen.dart';
import 'wishlist_screen.dart';
import 'chat_screen.dart';
import 'account_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const ChatScreen(),
    const AccountScreen(),
  ];

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(_selectedIndex);
  }

  @override
  void dispose() {
    _navigationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CircularBottomNavigation(
        [
          TabItem(Icons.home, "Trang chủ", Colors.orange),
          TabItem(Icons.shopping_cart, "Giỏ hàng", Colors.blue),
          TabItem(Icons.favorite, "Yêu thích", Colors.red),
          TabItem(Icons.chat, "Hỗ trợ", Colors.green),
          TabItem(Icons.person, "Tài khoản", Colors.purple),
        ],
        controller: _navigationController,
        selectedCallback: (index) {
          setState(() {
            _selectedIndex = index ?? 0;
          });
        },
      ),
    );
  }
}
