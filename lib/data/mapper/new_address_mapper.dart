import 'package:kovel_app/data/dto/address_dto/road_address.dart';
import 'package:kovel_app/domain/model/new_address.dart';

extension ToNewAddress on RoadAddress {
  NewAddress toNewAddress() {
    return NewAddress(
      addressName: addressName ?? '',
      region1depthName: region1depthName ?? '',
      region2depthName: region2depthName ?? '',
      region3depthName: region3depthName ?? '',
      roadName: roadName ?? '',
    );
  }
}
