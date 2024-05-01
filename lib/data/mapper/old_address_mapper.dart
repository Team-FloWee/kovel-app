import 'package:kovel_app/data/dto/address_dto/address.dart';
import 'package:kovel_app/domain/model/old_address.dart';

extension ToOldAddress on Address {
  OldAddress toOldAddress() {
    return OldAddress(
      addressName: addressName ?? '', // TODO: null 처리 필요한지 확인
      region1depthName: region1depthName ?? '',
      region2depthName: region2depthName ?? '',
      region3depthName: region3depthName ?? '',
    );
  }
}
