import 'package:beans_instapay/domain/use_case/get_drip_bag_info_use_case.dart';
import 'package:beans_instapay/presentation/home/product/product_state.dart';
import 'package:flutter/material.dart';

class ProductViewModel with ChangeNotifier {
  final GetDripBagInfoUseCase getDripBagInfo;

  ProductViewModel(this.getDripBagInfo) {
    fetchData();
  }

  ProductState _state = ProductState();

  ProductState get state => _state;

  Future<void> fetchData() async {
    final result = await getDripBagInfo();
    result.when(
      success: (data) {
        _state = state.copyWith(
          dripBagPageInfo: data,
        );
      },
      error: (message) {},
    );
  }
}
