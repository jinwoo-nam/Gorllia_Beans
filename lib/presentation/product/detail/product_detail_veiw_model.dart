import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/domain/use_case/details/get_coffee_beans_detail_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/details/get_drip_bag_detail_info_use_case.dart';
import 'package:beans_instapay/domain/use_case/details/get_stick_coffee_detail_info_use_case.dart';
import 'package:beans_instapay/presentation/product/detail/product_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailViewModel with ChangeNotifier {
  final GetDripBagDetailInfoUseCase getDripBagDetail;
  final GetStickCoffeeDetailInfoUseCase getStickCoffeeDetail;
  final GetCoffeeBeansDetailInfoUseCase getCoffeeBeansDetail;

  ProductDetailViewModel({
    required this.getDripBagDetail,
    required this.getCoffeeBeansDetail,
    required this.getStickCoffeeDetail,
  }) {
    fetchData();
  }
  ProductDetailState _state = ProductDetailState();

  ProductDetailState get state => _state;

  Future<void> fetchData() async {
    final dripBag = await getDripBagDetail();
    dripBag.when(
      success: (data) {
        _state = state.copyWith(
          dripBagDetailPageInfo: data,
        );
      },
      error: (message) {},
    );

    final stickCoffee = await getStickCoffeeDetail();
    stickCoffee.when(
      success: (data) {
        _state = state.copyWith(
          stickCoffeeDetailPageInfo: data,
        );
      },
      error: (message) {},
    );

    final coffeeBeans = await getCoffeeBeansDetail();
    coffeeBeans.when(
      success: (data) {
        _state = state.copyWith(
          coffeeBeansDetailPageInfo: data,
        );
      },
      error: (message) {},
    );
    notifyListeners();
  }

  void setProductType(String type) {
    if (ProductType.SingleOrigin.convertedText == type) {
      _state = state.copyWith(
        productType: ProductType.SingleOrigin,
      );
    } else if (ProductType.Decaf.convertedText == type) {
      _state = state.copyWith(
        productType: ProductType.Decaf,
      );
    } else {
      _state = state.copyWith(
        productType: ProductType.All,
      );
    }

    notifyListeners();
  }

  void setProductInfo(ProductInfo info) {
    _state = state.copyWith(
      productInfo: info,
    );
    notifyListeners();
  }

  void launchURL(Uri query) async {
    if (!await launchUrl(query)) throw 'Could not launch $query';
  }
}
