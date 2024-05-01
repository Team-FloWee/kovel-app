import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kovel_app/domain/model/old_address.dart';
import 'package:kovel_app/domain/model/new_address.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required NewAddress roadAddress,
    required OldAddress oldAddress,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
