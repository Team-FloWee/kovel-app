import 'package:kovel_app/domain/model/address.dart';

abstract interface class AddressInfoRepository {
  // TODO: class명
  Future<List<Address>> getAddress(String long, String lat); // TODO: 파라미터 변수명
}
