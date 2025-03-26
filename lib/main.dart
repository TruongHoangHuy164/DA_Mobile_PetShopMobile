import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:shopmeocung/views/cart_screen.dart';
import 'package:shopmeocung/views/dashboard_screen.dart';
import 'package:shopmeocung/views/login_screen.dart';
import 'package:shopmeocung/views/productdetail_screen.dart';
import 'package:shopmeocung/views/splash_screen.dart';
import 'theme_provider.dart';
import 'views/account_screen.dart'; // Nếu đã có
import 'views/settings_screen.dart'; // Nếu đã có

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
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
      title: 'Wikas PetShop',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
      ),
      routerConfig: _router,
    );
  }
}

// Cấu hình GoRouter
final GoRouter _router = GoRouter(
  initialLocation: '/', // Mở SplashScreen khi khởi động
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Không tìm thấy trang: ${state.uri}'),
    ),
  ),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        if (id == null) {
          return const Scaffold(
            body: Center(child: Text('Không tìm thấy sản phẩm')),
          );
        }
        return ProductDetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    // Các route con cho SettingsScreen
    GoRoute(
      path: '/settings/profile',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/settings/change-password',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/settings/orders/processing',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/settings/orders/shipping',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/settings/orders/completed',
      builder: (context, state) => const Placeholder(),
    ),
  ],
  redirect: (context, state) {
    // Để kiểm tra trạng thái đăng nhập, bạn cần tích hợp logic thực tế
    // Ví dụ: Dùng SharedPreferences hoặc Provider để kiểm tra token
    // Hiện tại tôi để trống để không cản trở đăng nhập
    final isOnLoginOrSplash = state.uri.toString() == '/' || state.uri.toString() == '/login';

    // Giả sử bạn có một biến hoặc hàm kiểm tra đăng nhập
    // Ví dụ: bool isLoggedIn = checkLoginStatus();
    bool isLoggedIn = true; // Thay bằng logic thực tế của bạn

    if (!isLoggedIn && !isOnLoginOrSplash) {
      return '/login'; // Chuyển về login nếu chưa đăng nhập
    }
    return null; // Không chuyển hướng nếu đã đăng nhập hoặc đang ở login/splash
  },
);