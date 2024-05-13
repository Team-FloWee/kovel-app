import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';

part 'archived.freezed.dart';
part 'archived.g.dart';

@freezed
class Archived with _$Archived {
  const factory Archived({
    required int id,
    required ContentType contentType,
    required String title,
    required String mapx,
    required String mapy,
    required String imagePath,
    required String tel,
  }) = _Archived;

  factory Archived.fromJson(Map<String, Object?> json) =>
      _$ArchivedFromJson(json);
}
