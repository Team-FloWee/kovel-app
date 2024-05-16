import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/data/dto/address_dto/address_dto.dart';
import 'package:kovel_app/domain/model/address.dart';
import 'package:kovel_app/domain/repository/address_info_repository.dart';

class GetAddressUseCase {
  final AddressInfoRepository _addressInfoRepository;

  const GetAddressUseCase({
    required AddressInfoRepository addressInfoRepository,
  }) : _addressInfoRepository = addressInfoRepository;

  Future<Result<List<Address>, NetworkError>> execute(
      {required String longitude, required String latitude}) async {
    final result = await _addressInfoRepository.getAddress(
        longitude: longitude, latitude: latitude);
    switch (result) {
      case Success<List<Address>, NetworkError>():
        return Result.success(result.data);
      case Error<List<Address>, NetworkError>():
        {
          switch (result.error) {
            case NetworkError.unauthorized:
              return Result.error(NetworkError.unauthorized);
            case NetworkError.notFound:
              return Result.error(NetworkError.notFound);
            case NetworkError.serverError:
              return Result.error(NetworkError.serverError);
            case NetworkError.requestTimeout:
              return Result.error(NetworkError.requestTimeout);
            case NetworkError.unknown:
              return Result.error(NetworkError.unknown);
          }
        }
    }
  }
}
