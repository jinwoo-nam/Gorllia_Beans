import 'package:beans_instapay/domain/model/product_page_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

part 'product_state.g.dart';

@freezed
class ProductState with _$ProductState {
  factory ProductState({
    ProductPageInfo? dripBagPageInfo,
    ProductPageInfo? stickCoffeePageInfo,
    ProductPageInfo? coffeeBeansPageInfo,
  }) = _ProductState;

  factory ProductState.fromJson(Map<String, dynamic> json) =>
      _$ProductStateFromJson(json);
}
