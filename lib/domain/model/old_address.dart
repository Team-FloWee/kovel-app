import 'package:freezed_annotation/freezed_annotation.dart';

part 'old_address.freezed.dart';
part 'old_address.g.dart';

@freezed
class OldAddress with _$OldAddress {
  const factory OldAddress({
    required String addressName,
    required String region1depthName,
    required String region2depthName,
    required String region3depthName,
  }) = _OldAddress;

  factory OldAddress.fromJson(Map<String, dynamic> json) => _$OldAddressFromJson(json);
}
