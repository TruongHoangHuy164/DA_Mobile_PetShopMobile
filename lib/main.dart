import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:shopmeocung/views/cart_screen.dart';
import 'package:shopmeocung/views/dashboard_screen.dart';
import 'package:shopmeocung/views/login_screen.dart';
import 'package:shopmeocung/views/productdetail_screen.dart';
import 'package:shopmeocung/views/splash_screen.dart';
import 'theme_provider.dart'; // Import ThemeProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'PetShop',
      themeMode: themeProvider.themeMode, // Áp dụng ThemeMode
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/', // Mở app sẽ vào SplashScreen trước
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return ProductDetailScreen(id: id ?? '0');
      },
    ),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
  ],
);
