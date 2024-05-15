import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/domain/model/address.dart';

abstract interface class AddressInfoRepository {
  // TODO: class명
  Future<Result<List<Address>,NetworkError>> getAddress({required String longitude, required String latitude});
}
