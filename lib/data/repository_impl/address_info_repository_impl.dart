import 'package:kovel_app/domain/repository/address_info_repository.dart';
import 'package:kovel_app/data/data_source/address_info_data_source.dart';
import 'package:kovel_app/data/dto/address_dto/address_dto.dart';
import 'package:kovel_app/data/mapper/address_mapper.dart';
import 'package:kovel_app/domain/model/address.dart';

class AddressInfoRepositoryImpl implements AddressInfoRepository {
  final AddressInfoDataSource _addressInfoDataSource;
  AddressInfoRepositoryImpl({
    required AddressInfoDataSource addressInfoDataSource,
  }) : _addressInfoDataSource = addressInfoDataSource;

  @override
  Future<List<Address>> getAddress({required String longitude, required String latitude}) async {
    final List<AddressDto> addressDto = await _addressInfoDataSource.getAddress(longitude: longitude, latitude: latitude);

    return addressDto.map((e) => e.toAddress()).toList();
  }
}
