import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/category/category_type.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';
import 'package:kovel_app/domain/model/category/course_category_type.dart';
import 'package:kovel_app/domain/model/category/dummy_category_type.dart';

part 'tour_detail.freezed.dart';
part 'tour_detail.g.dart';

@freezed
class TourDetail with _$TourDetail {
  const factory TourDetail({
    required int contentId,
    required ContentType contentType,
    required String title,
    required String address1,
    required String address2,
    required String zipCode,
    required String areaCode,
    required String category1,
    required String category2,
    required String category3,
    @JsonKey(fromJson: _categoryTypeFromJson, toJson: _categoryTypeToJson)
    required final CategoryType categoryType,
    required String createdTime,
    required String mapx,
    required String mapy,
    required String imagePath,
    required String tel,
    required String telName,
    required String overview,
  }) = _TourDetail;

  factory TourDetail.fromJson(Map<String, Object?> json) => _$TourDetailFromJson(json);
}

CategoryType _categoryTypeFromJson(Map<String, dynamic> json) {
  final courseCategoryId = json['courseCategoryId'] as String;
  return CourseCategoryType(courseCategoryId: courseCategoryId);
}

Map<String, dynamic> _categoryTypeToJson(CategoryType categoryType) {
  if (categoryType is CourseCategoryType) {
    return categoryType.toJson();
  } else if (categoryType is DummyCategoryType) {
    return categoryType.toJson();
  } else {
    throw ArgumentError('Unsupported CategoryType subtype');
  }
}