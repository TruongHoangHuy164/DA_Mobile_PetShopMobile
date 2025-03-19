import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart'; // Import Lottie

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Chuyển sang màn hình login sau 2 giây
    Timer(const Duration(seconds: 3), () {
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/splash.jpg', // Đảm bảo ảnh có trong thư mục assets
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.5)), // Làm tối nền
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(height: 20),
                Lottie.asset(
                  'assets/animations/Animationloading.json', // Hiệu ứng Lottie
                  width: 150,
                  repeat: true,
                ),
                const SizedBox(height: 10),
                Text(
                  'Đang tải...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
