import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';

part 'shopping_detail.freezed.dart';
part 'shopping_detail.g.dart';

@freezed
class ShoppingDetail with _$ShoppingDetail {
  const factory ShoppingDetail({
    required int contentId,
    required ContentType contentType,
    required String infoCenter,
    required String saleItem,
    required String saleItemCost,
    required String restDay,
    required String scale,
    required String creditCard,
    required String openTime,
  }) = _ShoppingDetail;

  factory ShoppingDetail.fromJson(Map<String, Object?> json) =>
      _$ShoppingDetailFromJson(json);
}
