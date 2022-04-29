import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_state.freezed.dart';
part 'product_state.g.dart';

@freezed
class ProductState with _$ProductState {
  factory ProductState({
    @Default([]) List<ProductInfo> dripBagInfoList,
  }) = _ProductState;
  factory ProductState.fromJson(Map<String, dynamic> json) => _$ProductStateFromJson(json);
}