import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required int id,
    required int contentTypeId,
    required String title,
    required String address1,
    required String address2,
    required String zipCode,
    required String areaCode,
    required String category1,
    required String category2,
    required String category3,
    required String categoryType,
    required String mapx,
    required String mapy,
    required String imagePath,
    required String tel,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, Object?> json) =>
      _$ScheduleFromJson(json);
}
