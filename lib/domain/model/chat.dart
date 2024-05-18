import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enum/chat_case.dart';
import 'package:kovel_app/core/enum/chat_type.dart';

class Chat {
  final String text;
  final String role;
  final ChatType chatType;
  final ChatCase chatCase;

  Chat({required this.text, required this.role, required this.chatType, required this.chatCase});

  @override
  String toString() {
    return 'Chat(text: $text, role: $role, chatType: $chatType, chatCase: $chatCase)';
  }
}