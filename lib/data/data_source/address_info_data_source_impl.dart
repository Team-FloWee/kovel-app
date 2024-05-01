import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kovel_app/data/data_source/address_info_data_source.dart';
import 'package:kovel_app/data/dto/address_dto/address_dto.dart';

class AddressInfoDataSourceImpl implements AddressInfoDataSource {
  final Dio _dio;
  final String baseUrl = dotenv.get('ADDRESS_BASE_URL');
  final String key = dotenv.get('KAKAO_REST_API_KEY');
  AddressInfoDataSourceImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<List<AddressDto>> getAddress({required String longitude, required String latitude}) async {
    final Response response;
    String url = '$baseUrl?x=$longitude&y=$latitude&input_coord=WGS84';

    response = await _dio.get(url, options: Options(headers: {'Authorization': key}));
    print('response: $response');
    final List jsonList = response.data['documents'] != '' ? response.data['documents'] : throw Exception('주소 데이터가 없습니다.');

    return jsonList.map((e) => AddressDto.fromJson(e)).toList();
  }
}
