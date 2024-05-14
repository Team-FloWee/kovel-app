import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/data/data_source/address_info_data_source.dart';
import 'package:kovel_app/data/dto/address_dto/address_dto.dart';

class AddressInfoDataSourceImpl implements AddressInfoDataSource {
  final Dio _dio;
  final String baseUrl = dotenv.get('ADDRESS_BASE_URL');
  final String key = dotenv.get('KAKAO_REST_API_KEY');

  AddressInfoDataSourceImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<AddressDto>, NetworkError>> getAddress({required String longitude, required String latitude}) async {
    final Response response;
    String url = '$baseUrl?x=$longitude&y=$latitude&input_coord=WGS84';

    response = await _dio.get(url, options: Options(headers: {'Authorization': key}));

    final List jsonList = response.data['documents'];

    try {
      if (response.data['documents'] != null) {
        return Result.success(jsonList.map((e) => AddressDto.fromJson(e)).toList());
      } else {
        return const Result.success([]);
      }
    } on TimeoutException {
      return const Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return const Result.error(NetworkError.unknown);
    }
  }
}
