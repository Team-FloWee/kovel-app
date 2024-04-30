import 'package:kovel_app/data/dto/address_dto/address_dto.dart';
import 'package:kovel_app/data/mapper/old_address_mapper.dart';
import 'package:kovel_app/domain/model/address.dart';
import 'package:kovel_app/data/mapper/road_address_mapper.dart';
import 'package:kovel_app/domain/model/old_address.dart';
import 'package:kovel_app/domain/model/road_address.dart';

extension AddressDtoExtension on AddressDto {
  Address toAddress() {
    return Address(
      roadAddress: roadAddress != null ? roadAddress!.toRoadAddress() : const RoadAddress(addressName: '', region1depthName: '', region2depthName: '', region3depthName: '', roadName: ''),
      oldAddress: oldAddress != null ? oldAddress!.toOldAddress() : const OldAddress(addressName: '', region1depthName: '', region2depthName: '', region3depthName: ''),
    );
  }
}
