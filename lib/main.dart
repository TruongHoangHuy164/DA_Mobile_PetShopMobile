import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopmeocung/views/cart_screen.dart';
import 'package:shopmeocung/views/dashboard_screen.dart';

import 'package:shopmeocung/views/login_screen.dart';
import 'package:shopmeocung/views/productdetail_screen.dart';

import 'package:shopmeocung/views/splash_screen.dart'; // Import SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'PetShop',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Roboto'),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/', // Mở app sẽ vào SplashScreen trước
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()), // Splash Screen
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()), // Login Screen
    GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
    GoRoute(path: '/product/:id', builder: (context, state) {
      final id = state.pathParameters['id'];
      return ProductDetailScreen(id: id ?? '0');
    }),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
  ],
);
