import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_intro_state.freezed.dart';
part 'product_intro_state.g.dart';

@freezed
class ProductIntroState with _$ProductIntroState {
  factory ProductIntroState({
    @Default(1) int selectedProductCount,
    @Default('') String selectedProductType,
  }) = _ProductIntroState;
  factory ProductIntroState.fromJson(Map<String, dynamic> json) => _$ProductIntroStateFromJson(json);
}