import 'dart:async';

import 'package:beans_instapay/domain/use_case/get_coffee_beans_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/get_drip_bag_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/get_stick_coffee_info_use_case.dart';
import 'package:beans_instapay/presentation/home/product/drop_box_event.dart';
import 'package:beans_instapay/presentation/home/product/product_event.dart';
import 'package:beans_instapay/presentation/home/product/product_state.dart';
import 'package:beans_instapay/presentation/product/detail/coffee_beans_detail_screen.dart';
import 'package:beans_instapay/presentation/product/detail/dripbag_detail_screen.dart';
import 'package:beans_instapay/presentation/product/detail/stick_coffee_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductViewModel with ChangeNotifier {
  final GetDripBagInfoUseCase getDripBagInfo;
  final GetStickCoffeeInfoUseCase getStickCoffeeInfo;
  final GetCoffeeBeansInfoUseCase getCoffeeBeansInfo;

  ProductViewModel({
    required this.getDripBagInfo,
    required this.getStickCoffeeInfo,
    required this.getCoffeeBeansInfo,
  }) {
    fetchData();
  }

  ProductState _state = ProductState();

  ProductState get state => _state;

  final _eventController = StreamController<DropBoxEvent>.broadcast();

  Stream<DropBoxEvent> get eventStream => _eventController.stream;

  void onDropBoxEvent(DropBoxEvent event) {
    event.when(tapped: (type) {
      _eventController.add(DropBoxEvent.tapped(type));
    });
  }

  Widget getProductDetailPage(String type) {
    switch (type) {
      case '드립백':
        return const DripBagDetailScreen();

      case '원두스틱 커피':
        return const StickCoffeeDetailScreen();

      case '커피 원두':
        return const CoffeeBeansDetailScreen();

      default:
        return const Text('잘못 입력되었습니다.');
    }
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

  Future<void> fetchData() async {
    final dripBag = await getDripBagInfo();
    dripBag.when(
      success: (data) {
        _state = state.copyWith(
          dripBagPageInfo: data,
        );
      },
      error: (message) {},
    );

    final stickCoffee = await getStickCoffeeInfo();
    stickCoffee.when(
      success: (data) {
        _state = state.copyWith(
          stickCoffeePageInfo: data,
        );
      },
      error: (message) {},
    );

    final coffeeBeans = await getCoffeeBeansInfo();
    coffeeBeans.when(
      success: (data) {
        _state = state.copyWith(
          coffeeBeansPageInfo: data,
        );
      },
      error: (message) {},
    );
    notifyListeners();
  }
}
