import 'package:kovel_app/domain/model/address.dart';
import 'package:kovel_app/domain/repository/address_info_repository.dart';

class GetAddressInfoUseCase {
  final AddressInfoRepository _addressInfoRepository;

  const GetAddressInfoUseCase({
    required AddressInfoRepository addressInfoRepository,
  }) : _addressInfoRepository = addressInfoRepository;

  Future<List<Address>> execute({
    int pageNo = 1,
    required String longitude,
    required String latitude,
  }) async {
    final result = await _addressInfoRepository.getAddress(longitude: longitude, latitude: latitude);
    return result;
  }
}
