import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  factory MainState({
    ProductInfo? productInfo,
  }) = _MainState;

  factory MainState.fromJson(Map<String, dynamic> json) =>
      _$MainStateFromJson(json);
}
