import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/main_state.dart';
import 'package:flutter/material.dart';

class MainViewModel with ChangeNotifier {
  MainState _state = MainState();

  MainState get state => _state;

  void setProductInfo(ProductInfo info) {
    _state = state.copyWith(
      productInfo: info,
    );
    notifyListeners();
  }
}
