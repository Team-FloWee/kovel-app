import 'package:kovel_app/data/dto/address_dto/address_dto.dart';

abstract interface class AddressInfoDataSource {
  Future<List<AddressDto>> getAddress({required String longitude, required String latitude});
}
