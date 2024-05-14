import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
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
  Future<List<Address>> getAddress(
      {required String longitude, required String latitude}) async {
    final addressDto = await _addressInfoDataSource.getAddress(
        longitude: longitude, latitude: latitude);

    switch (addressDto) {
      case Success<List<AddressDto>, NetworkError>():
        return addressDto.data.map((e) => e.toAddress()).toList();

      case Error<List<AddressDto>, NetworkError>():
        {
          switch (addressDto.error) {
            case NetworkError.requestTimeout:
              throw Result.error('Network error occurred');
            case NetworkError.unknown:
              throw Result.error('Unexpected error occurred');
          }
        }
    }
  }
}
