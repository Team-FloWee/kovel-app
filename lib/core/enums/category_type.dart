enum CategoryType {
  allCourse(code: '', name: '전체'),
  famCourse(code: 'C0112', name: '가족코스'),
  aloneCourse(code: 'C0113', name: '나홀로코스'),
  healCourse(code: 'C0114', name: '힐링코스'),
  walkCourse(code: 'C0115', name: '도보코스'),
  campCourse(code: 'C0116', name: '캠핑코스'),
  tasteCourse(code: 'C0117', name: '맛코스');

  final String code;
  final String name;

  const CategoryType({required this.code, required this.name});

  factory CategoryType.getByCode({required String code}) {
    return CategoryType.values.firstWhere((element) => element.code == code);
  }
}
