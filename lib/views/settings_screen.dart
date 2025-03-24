import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(), // Quay lại màn hình trước
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề phần tài khoản
              const Text(
                "Quản lý tài khoản",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text("Thông tin cá nhân"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Chuyển đến màn hình chỉnh sửa thông tin cá nhân
                  context.push('/settings/profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: const Text("Đổi mật khẩu"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Chuyển đến màn hình đổi mật khẩu
                  context.push('/settings/change-password');
                },
              ),

              const Divider(height: 30),

              // Tiêu đề phần đơn hàng
              const Text(
                "Kiểm soát đơn hàng",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.shopping_bag_outlined),
                title: const Text("Đơn hàng đang xử lý"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  context.push('/settings/orders/processing');
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_shipping_outlined),
                title: const Text("Đơn hàng đang giao"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  context.push('/settings/orders/shipping');
                },
              ),
              ListTile(
                leading: const Icon(Icons.check_circle_outline),
                title: const Text("Đơn hàng đã hoàn thành"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  context.push('/settings/orders/completed');
                },
              ),

              const Divider(height: 30),

              // Tiêu đề phần thông báo
              const Text(
                "Cài đặt thông báo",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SwitchListTile(
                secondary: const Icon(Icons.notifications_outlined),
                title: const Text("Thông báo đơn hàng"),
                value: true, // Giá trị mặc định, có thể thay bằng state
                onChanged: (bool value) {
                  // Logic bật/tắt thông báo đơn hàng
                },
                activeColor: Colors.orange,
              ),
              SwitchListTile(
                secondary: const Icon(Icons.message_outlined),
                title: const Text("Thông báo tin nhắn"),
                value: false, // Giá trị mặc định
                onChanged: (bool value) {
                  // Logic bật/tắt thông báo tin nhắn
                },
                activeColor: Colors.orange,
              ),

              const Divider(height: 30),

              // Nút xóa tài khoản (tùy chọn nguy hiểm)
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    _showDeleteAccountDialog(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: const Text("Xóa tài khoản"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hiển thị dialog xác nhận xóa tài khoản
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xóa tài khoản"),
        content: const Text("Bạn có chắc chắn muốn xóa tài khoản? Hành động này không thể hoàn tác."),
        actions: [
          TextButton(
            onPressed: () => context.pop(), // Đóng dialog
            child: const Text("Hủy", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              // Logic xóa tài khoản (gọi API hoặc xử lý)
              context.pop(); // Đóng dialog
              context.go('/login'); // Chuyển về màn hình đăng nhập
            },
            child: const Text("Xóa", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}