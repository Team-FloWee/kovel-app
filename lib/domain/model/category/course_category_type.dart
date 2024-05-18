import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kovel_app/domain/model/category/category_type.dart';

part 'course_category_type.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseCategoryType extends CategoryType {
  final String courseCategoryId;

  CourseCategoryType({required this.courseCategoryId})
      : super(id: courseCategoryId);

  factory CourseCategoryType.fromJson(Map<String, dynamic> json) =>
      _$CourseCategoryTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CourseCategoryTypeToJson(this);

  @override
  String get name => switch (courseCategoryId) {
        'C0112' => '가족코스'.tr(),
        'C0113' => '나홀로코스'.tr(),
        'C0114' => '힐링코스'.tr(),
        'C0115' => '도보코스'.tr(),
        'C0116' => '캠핑코스'.tr(),
        'C0117' => '맛코스'.tr(),
        _ => '전체'.tr()
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
