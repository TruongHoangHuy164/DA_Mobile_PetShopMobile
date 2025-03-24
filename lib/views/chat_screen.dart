import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final types.User _customer = const types.User(id: 'customer');
  final types.User _support = const types.User(id: 'support');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hỗ trợ khách hàng")),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _customer,
        theme: const DefaultChatTheme(
          primaryColor: Colors.orange, // Màu chủ đạo
          secondaryColor: Colors.white,
          inputBackgroundColor: Colors.orangeAccent,
          inputTextColor: Colors.white,
        ),
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _customer,
      id: const Uuid().v4(),
      text: message.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, textMessage);
      _simulateSupportReply();
    });
  }

  void _simulateSupportReply() {
    Future.delayed(const Duration(seconds: 1), () {
      final reply = types.TextMessage(
        author: _support,
        id: const Uuid().v4(),
        text: "Xin chào! Chúng tôi có thể giúp gì cho bạn?",
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      setState(() {
        _messages.insert(0, reply);
      });
    });
  }
}
