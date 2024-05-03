import 'package:kovel_app/domain/model/category/category.dart';

class AreaType extends Category {
  final String areaCode;
  AreaType({required this.areaCode}) : super(id: areaCode);

  @override
  String get name => switch (areaCode)  {
    '99' => '내주변',
    '1' => '서울',
    '2' => '인천',
    '3' => '대전',
    '4' => '대구',
    '5' => '광주',
    '6' => '부산',
    '7' => '울산',
    '8' => '세종',
    '32' => '강원도',
    '33' || '34' => '충청도',
    '35' || '36' => '경상도',
    '37' || '38' => '전라도',
    '39' => '제주도',
    _ => '전체'
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
    AreaType(areaCode: '8'),
    AreaType(areaCode: '32'),
    AreaType(areaCode: '33'), // + 34
    AreaType(areaCode: '35'), // + 36
    AreaType(areaCode: '37'), // + 38
    AreaType(areaCode: '39'),
  ];
}