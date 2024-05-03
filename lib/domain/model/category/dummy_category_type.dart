import 'package:kovel_app/domain/model/category/category_type.dart';

import 'package:json_annotation/json_annotation.dart';

part 'dummy_category_type.g.dart';

@JsonSerializable(explicitToJson: true)
class DummyCategoryType extends CategoryType{
  DummyCategoryType({required super.id});

  factory DummyCategoryType.fromJson(Map<String, dynamic> json) => _$DummyCategoryTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DummyCategoryTypeToJson(this);

  @override
  String get name => '';
}