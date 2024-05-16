// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      text: json['text'] as String,
      role: json['role'] as String,
      chatCase: $enumDecode(_$ChatCaseEnumMap, json['chatCase']),
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'role': instance.role,
      'chatCase': _$ChatCaseEnumMap[instance.chatCase]!,
    };

const _$ChatCaseEnumMap = {
  ChatCase.recommendPlan: 'recommendPlan',
  ChatCase.archiveBaseCourse: 'archiveBaseCourse',
  ChatCase.text: 'text',
};
