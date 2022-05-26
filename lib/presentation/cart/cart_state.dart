import 'package:beans_instapay/domain/model/cart_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_state.freezed.dart';
part 'cart_state.g.dart';

@freezed
class CartState with _$CartState {
  factory CartState({
    @Default([]) List<CartInfo> cartInfo,
  }) = _CartState;
  factory CartState.fromJson(Map<String, dynamic> json) => _$CartStateFromJson(json);
}