import 'package:kovel_app/domain/model/category/category_type.dart';

import 'package:json_annotation/json_annotation.dart';

part 'course_category_type.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseCategoryType extends CategoryType{
  final String courseCategoryId;
  CourseCategoryType({required this.courseCategoryId}) : super(id: courseCategoryId);

  factory CourseCategoryType.fromJson(Map<String, dynamic> json) => _$CourseCategoryTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CourseCategoryTypeToJson(this);

  @override
  String get name => switch (courseCategoryId)  {
    'C0112' => '가족코스',
    'C0113' => '나홀로코스',
    'C0114' => '힐링코스',
    'C0115' => '도보코스',
    'C0116' => '캠핑코스',
    'C0117' => '맛코스',
    _ => '전체'
  };
}

class CourseCategoryTypeList {
  static final typeList = [
    CourseCategoryType(courseCategoryId: ''),
    CourseCategoryType(courseCategoryId: 'C0112'),
    CourseCategoryType(courseCategoryId: 'C0113'),
    CourseCategoryType(courseCategoryId: 'C0114'),
    CourseCategoryType(courseCategoryId: 'C0115'),
    CourseCategoryType(courseCategoryId: 'C0116'),
    CourseCategoryType(courseCategoryId: 'C0117'),
  ];
}
