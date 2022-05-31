import 'package:beans_instapay/domain/use_case/api_test_use_case.dart';
import 'package:beans_instapay/presentation/components/temp/api_test_state.dart';
import 'package:flutter/material.dart';

class NoticeSampleViewModel with ChangeNotifier {
    final ApiTestUseCase apiTest;

  NoticeSampleViewModel(this.apiTest) {
    fetchData();
  }

  ApiTestState _state = ApiTestState();

  ApiTestState get state => _state;

  void fetchData() async {
    final test = await apiTest();

    test.when(
      success: (data) {
        _state = state.copyWith(
          notice: data,
        );
      },
      error: (message) {},
    );
    notifyListeners();
  }
}
