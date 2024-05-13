import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kovel_app/domain/use_case/ai/get_translated_data_stream_use_case.dart';

class AiProvider with ChangeNotifier {
  final GetTranslatedDataStreamUseCase _getTranslatedDataStreamUseCase;

  AiProvider({required GetTranslatedDataStreamUseCase getTranslatedDataStreamUseCase}) : _getTranslatedDataStreamUseCase = getTranslatedDataStreamUseCase;

  String _translatedData = '';
  String get translatedData => _translatedData;

  StreamSubscription? _subscription;

  void getTranslatedDataStream({required String request, required String language}) {
    _translatedData = '';
    _subscription?.cancel();
    _subscription = _getTranslatedDataStreamUseCase.execute(request: request, language: language).listen((event) {
      _translatedData += event.text ?? '';
      notifyListeners();
    });
  }
}