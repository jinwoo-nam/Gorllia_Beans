import 'dart:async';

import 'package:beans_instapay/presentation/home/product/drop_box_event.dart';
import 'package:beans_instapay/presentation/home/product/product_event.dart';
import 'package:beans_instapay/presentation/product/widget/product_intro_state.dart';
import 'package:flutter/material.dart';

class ProductIntroViewModel with ChangeNotifier {
  ProductIntroState _state = ProductIntroState();

  ProductIntroState get state => _state;

  final _eventController = StreamController<DropBoxEvent>.broadcast();

  Stream<DropBoxEvent> get eventStream => _eventController.stream;

  void onDropBoxEvent(DropBoxEvent event) {
    event.when(tapped: (type) {
      _eventController.add(DropBoxEvent.tapped(type));
    });
  }


  void onEvent(ProductEvent event) {
    event.when(
      selectProductCount: selectProductCount,
      selectProductValue: selectProductValue,
    );
  }


  void selectProductCount(int count) {
    setProductCount(count);
    notifyListeners();
  }

  void selectProductValue(String value) {
    setProductValue(value);
    notifyListeners();
  }

  void setProductCount(int count) {
    _state = state.copyWith(
      selectedProductCount: count,
    );
  }

  void setProductValue(String value) {
    _state = state.copyWith(
      selectedProductType: value,
    );
  }

}

