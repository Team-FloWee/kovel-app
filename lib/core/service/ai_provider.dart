import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kovel_app/core/enum/networkError.dart';
import 'package:kovel_app/core/result/result.dart';
import 'package:kovel_app/domain/use_case/ai/get_translated_data_stream_use_case.dart';

class AiProvider with ChangeNotifier {
  final GetTranslatedDataStreamUseCase _getTranslatedDataStreamUseCase;

  final _eventController = StreamController<Result>();

  Stream<Result> get eventStream => _eventController.stream;

  AiProvider({required GetTranslatedDataStreamUseCase getTranslatedDataStreamUseCase}) : _getTranslatedDataStreamUseCase = getTranslatedDataStreamUseCase;

  String _translatedData = '';
  String get translatedData => _translatedData;

  StreamSubscription<Result>? _subscription;

  void getTranslatedDataStream({required String request, required String language}) {
    _translatedData = '';
    _subscription?.cancel();
    // // 원래 코드
    // _subscription = _getTranslatedDataStreamUseCase.execute(request: request, language: language).listen((event) {
    //   _translatedData += event.text ?? '';
    //   notifyListeners();
    // });
    // 변경 코드
    Result result = _getTranslatedDataStreamUseCase.execute(request: request, language: language);

    result.when(success: (data) {
      data.listen((response) {
        _translatedData += response.text ?? '';
        _eventController.add(Result.success(_translatedData));
      });
      notifyListeners();
    }, error: (error) {
      _eventController.add(Result.error(error));
      notifyListeners();
    });
  }
}
