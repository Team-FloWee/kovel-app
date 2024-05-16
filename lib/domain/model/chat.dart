import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enum/chat_case.dart';

class Chat {
  final String text;
  final String role;
  final ChatCase chatCase;

  Chat({required this.text, required this.role, required this.chatCase});
}