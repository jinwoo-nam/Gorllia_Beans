import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.freezed.dart';

part 'product_detail_state.g.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  factory ProductDetailState({
    ProductDetailPageInfo? dripBagDetailPageInfo,
    ProductDetailPageInfo? stickCoffeeDetailPageInfo,
    ProductDetailPageInfo? coffeeBeansDetailPageInfo,
  }) = _ProductDetailState;

  factory ProductDetailState.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailStateFromJson(json);
}
