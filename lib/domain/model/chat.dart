import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/core/enum/chat_case.dart';

part 'chat.freezed.dart';

part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String text,
    required String role,
    required ChatCase chatCase
  }) = _Chat;

  factory Chat.fromJson(Map<String, Object?> json) => _$ChatFromJson(json);
}