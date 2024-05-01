import 'package:kovel_app/domain/model/address.dart';

abstract interface class AddressInfoRepository {
  // TODO: class명
  Future<List<Address>> getAddress({required String longitude, required String latitude});
}
