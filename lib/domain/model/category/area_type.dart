import 'package:easy_localization/easy_localization.dart';
import 'package:kovel_app/domain/model/category/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area_type.g.dart';

@JsonSerializable(explicitToJson: true)
class AreaType extends Category {
  final String areaCode;

  AreaType({required this.areaCode}) : super(id: areaCode);

  factory AreaType.fromJson(Map<String, dynamic> json) =>
      _$AreaTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AreaTypeToJson(this);

  @override
  String get name => switch (areaCode) {
        '99' => '내주변'.tr(),
        '1' => '서울'.tr(),
        '2' => '인천'.tr(),
        '3' => '대전'.tr(),
        '4' => '대구'.tr(),
        '5' => '광주'.tr(),
        '6' => '부산'.tr(),
        '7' => '울산'.tr(),
        '8' => '세종'.tr(),
        '31' => '경기도'.tr(),
        '32' => '강원도'.tr(),
        '33' || '34' => '충청도'.tr(),
        '35' || '36' => '경상도'.tr(),
        '37' || '38' => '전라도'.tr(),
        '39' => '제주도'.tr(),
        _ => '전국'.tr()
      };
}

class AreaTypeList {
  static final typeList = [
    AreaType(areaCode: '99'), // 내주변
    AreaType(areaCode: ''), // 전체
    AreaType(areaCode: '1'),
    AreaType(areaCode: '2'),
    AreaType(areaCode: '3'),
    AreaType(areaCode: '4'),
    AreaType(areaCode: '5'),
    AreaType(areaCode: '6'),
    AreaType(areaCode: '7'),
    AreaType(areaCode: '8'),
    AreaType(areaCode: '31'),
    AreaType(areaCode: '32'),
    AreaType(areaCode: '33'), // + 34
    AreaType(areaCode: '35'), // + 36
    AreaType(areaCode: '37'), // + 38
    AreaType(areaCode: '39'),
  ];
}
