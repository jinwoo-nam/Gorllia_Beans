import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
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
    @Default(ProductType.All) ProductType productType,
    ProductInfo? productInfo,
  }) = _ProductDetailState;

  factory ProductDetailState.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailStateFromJson(json);
}

enum ProductType {
  All,
  SingleOrigin,
  Decaf,
}

extension ProductTypeExtension on ProductType {
  String get convertedText {
    switch(this){
      case ProductType.All:
        return "All";
      case ProductType.SingleOrigin:
        return "싱글오리진";
      case ProductType.Decaf:
        return "디카페인";
      default:
        return "";
    }
  }

  ProductType get convertedProductType{
    switch(convertedText){
      case "All":
        return ProductType.All;
      case "싱글오리진":
        return ProductType.SingleOrigin;
      case "디카페인":
        return ProductType.Decaf;
      default:
        return ProductType.All;
    }
  }
}