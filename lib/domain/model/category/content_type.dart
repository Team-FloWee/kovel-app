import 'package:kovel_app/domain/model/category/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_type.g.dart';

@JsonSerializable(explicitToJson: true)
class ContentType extends Category {
  final int contentTypeId;
  ContentType({required this.contentTypeId}) : super(id: contentTypeId.toString());

  factory ContentType.fromJson(Map<String, dynamic> json) => _$ContentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ContentTypeToJson(this);

  @override
  String get name => switch (contentTypeId)  {
    12 => '관광지',
    14 => '문화시설',
    15 => '축제공연행사',
    25 => '여행코스',
    28 => '레포츠',
    32 => '숙박',
    38 => '쇼핑',
    39 => '음식점',
    75 => 'Leports',
    76 => 'Tourist',
    77 => 'Traffic',
    78 => 'Culture',
    79 => 'Shopping',
    80 => 'Lodgment',
    82 => 'Restaurant',
    85 => 'Festival',
    _ => '전체'
  };
}

class ContentTypeList {
  static final typeList = [
    ContentType(contentTypeId: 0),
    ContentType(contentTypeId: 12),
    ContentType(contentTypeId: 14),
    ContentType(contentTypeId: 15),
    // ContentType(contentTypeId: 25),
    ContentType(contentTypeId: 28),
    ContentType(contentTypeId: 32),
    ContentType(contentTypeId: 38),
    ContentType(contentTypeId: 39),
    ContentType(contentTypeId: 75),
    ContentType(contentTypeId: 76),
    ContentType(contentTypeId: 77),
    ContentType(contentTypeId: 78),
    ContentType(contentTypeId: 79),
    ContentType(contentTypeId: 80),
    ContentType(contentTypeId: 82),
  ];
}
