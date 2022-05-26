import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_info.freezed.dart';

part 'cart_info.g.dart';

@freezed
class CartInfo with _$CartInfo {
  factory CartInfo({
    required ProductInfo productInfo,
    required int count,
    BeanType? beanType,
  }) = _CartInfo;

  factory CartInfo.fromJson(Map<String, dynamic> json) =>
      _$CartInfoFromJson(json);
}

enum BeanType {
  Whole,
  Drip,
}
