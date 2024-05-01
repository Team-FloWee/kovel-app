import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_address.freezed.dart';
part 'new_address.g.dart';

@freezed
class NewAddress with _$NewAddress {
  const factory NewAddress({
    required String addressName,
    required String region1depthName,
    required String region2depthName,
    required String region3depthName,
    required String roadName,
  }) = _NewAddress;

  factory NewAddress.fromJson(Map<String, dynamic> json) => _$NewAddressFromJson(json);
}
