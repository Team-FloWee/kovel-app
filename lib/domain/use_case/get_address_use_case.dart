import 'package:kovel_app/domain/model/address.dart';
import 'package:kovel_app/domain/repository/address_info_repository.dart';

class GetAddressUseCase {
  final AddressInfoRepository _addressInfoRepository;

  const GetAddressUseCase({
    required AddressInfoRepository addressInfoRepository,
  }) : _addressInfoRepository = addressInfoRepository;

  Future<List<Address>> execute({required String longitude, required String latitude}) async {
    final result = await _addressInfoRepository.getAddress(longitude: longitude, latitude: latitude);
    return result;
  }
}
