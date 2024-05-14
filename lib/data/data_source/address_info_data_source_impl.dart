import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/domain/repository/address_info_repository.dart';
import 'package:kovel_app/data/data_source/address_info_data_source.dart';
import 'package:kovel_app/data/dto/address_dto/address_dto.dart';
import 'package:kovel_app/data/mapper/address_mapper.dart';
import 'package:kovel_app/domain/model/address.dart';
import 'package:kovel_app/core/result/result.dart'; // Result 클래스를 사용하기 위해 추가

class AddressInfoRepositoryImpl implements AddressInfoRepository {
  final AddressInfoDataSource _addressInfoDataSource;
  AddressInfoRepositoryImpl({
    required AddressInfoDataSource addressInfoDataSource,
  }) : _addressInfoDataSource = addressInfoDataSource;

  @override
  Future<List<Address>> getAddress({required String longitude, required String latitude}) async {
    final result = await _addressInfoDataSource.getAddress(longitude: longitude, latitude: latitude);

    if (result is Success<List<AddressDto>, NetworkError>) {
      return result.data.map((e) => e.toAddress()).toList();
    } else if (result is Error<List<AddressDto>, NetworkError>) {
// 오류 처리 로직을 추가할 수 있습니다.
      throw Exception('Network error occurred');
    }
    throw Exception('Unexpected error occurred');
  }
}