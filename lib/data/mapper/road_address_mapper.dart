import 'package:kovel_app/data/dto/address_dto/road_address_dto.dart';
import 'package:kovel_app/domain/model/road_address.dart';

extension ToRoadAddress on RoadAddressDto {
  RoadAddress toRoadAddress() {
    return RoadAddress(
      addressName: addressName ?? '',
      region1depthName: region1depthName ?? '',
      region2depthName: region2depthName ?? '',
      region3depthName: region3depthName ?? '',
      roadName: roadName ?? '',
    );
  }
}
