import 'package:kovel_app/domain/model/category/category.dart';

import 'package:json_annotation/json_annotation.dart';

part 'category_type.g.dart';

@JsonSerializable(explicitToJson: true)
abstract class CategoryType extends Category {
  CategoryType({required super.id});

  factory CategoryType.fromJson(Map<String, dynamic> json) => _$CategoryTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryTypeToJson(this);

  @override
  String get name;
}