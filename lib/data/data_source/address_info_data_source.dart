import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/data/dto/address_dto/address_dto.dart';

abstract interface class AddressInfoDataSource {
  Future<Result<List<AddressDto>, NetworkError>> getAddress({required String longitude, required String latitude});
}
