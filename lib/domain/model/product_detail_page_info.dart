import 'package:json_annotation/json_annotation.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_page_info.freezed.dart';

part 'product_detail_page_info.g.dart';

@freezed
class ProductDetailPageInfo with _$ProductDetailPageInfo {
  factory ProductDetailPageInfo({
    required String title,
    required String description,
    required List<String> categories,
    required List<ProductInfo> productInfo,
  }) = _ProductDetailPageInfo;

  factory ProductDetailPageInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailPageInfoFromJson(json);
}
