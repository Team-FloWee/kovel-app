enum ContentType {
  error(id: 0, text: '에러'),
  touristSpot(id: 12, text: '관광지'),
  cultureLocation(id: 14, text: '문화시설'),
  festival(id: 15, text: '축제공연행사'),
  course(id: 25, text: '여행코스'),
  leports(id: 28, text: '레포츠'),
  lodgment(id: 32, text: '숙박'),
  shopping(id: 38, text: '쇼핑'),
  restaurant(id: 39, text: '음식점');

  final int id;
  final String text;

  const ContentType({
    required this.id,
    required this.text
  });

  factory ContentType.getById({required int id}) {
    return ContentType.values.firstWhere((element) => element.id == id);
  }
}