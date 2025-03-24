import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:go_router/go_router.dart';
import '../theme_provider.dart';
import 'settings_screen.dart'; // Import SettingsScreen

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/truonghuy.jpg"),
            ),
            const SizedBox(height: 10),
            const Text(
              "Người dùng",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),

            // Nút bật/tắt Dark Mode
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: LiteRollingSwitch(
                value: themeProvider.isDarkMode,
                textOn: "Dark Mode",
                textOff: "Light Mode",
                colorOn: Colors.black26,
                colorOff: Colors.orange,
                iconOn: Icons.dark_mode,
                iconOff: Icons.light_mode,
                textSize: 13.0,
                textOnColor: Colors.white,
                onChanged: (bool state) {
                  themeProvider.toggleTheme(state);
                },
                onDoubleTap: () {},
                onSwipe: () {},
                onTap: () {},
              ),
            ),

            const SizedBox(height: 25, width: 30,),

            // ListTile(
            //   leading: const Icon(Icons.person),
            //   title: const Text("Chỉnh sửa hồ sơ"),
            //   onTap: () {
            //     context.push('/account/profile'); // Điều hướng đến màn hình chỉnh sửa hồ sơ
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Cài đặt"),
              onTap: () {
                context.push('/settings'); // Điều hướng đến SettingsScreen
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Đăng xuất"),
              onTap: () {
                context.go('/login'); // Chuyển về màn hình đăng nhập
              },
            ),
          ],
        ),
      ),
    );
  }
}