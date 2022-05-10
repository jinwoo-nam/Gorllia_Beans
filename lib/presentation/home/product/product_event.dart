import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.selectProductCount(int count) = SelectProductCount;
  const factory ProductEvent.selectProductValue(String value) = SelectProductValue;
}
