import 'package:beans_instapay/domain/use_case/get_drip_bag_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/get_stick_coffee_info_use_case.dart';
import 'package:beans_instapay/presentation/home/product/product_state.dart';
import 'package:flutter/material.dart';

class ProductViewModel with ChangeNotifier {
  final GetDripBagInfoUseCase getDripBagInfo;
  final GetStickCoffeeInfoUseCase getStickCoffeeInfo;

  ProductViewModel({
    required this.getDripBagInfo,
    required this.getStickCoffeeInfo,
  }) {
    fetchData();
  }

  ProductState _state = ProductState();

  ProductState get state => _state;

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
  }
}
