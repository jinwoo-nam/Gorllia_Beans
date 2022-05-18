import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_page_info.freezed.dart';

part 'product_page_info.g.dart';

@freezed
class ProductPageInfo with _$ProductPageInfo {
  factory ProductPageInfo({
    required String title,
    required String subtitle,
    required String comment,
    required String imageUrl,
    required List<ProductInfo> productInfo,
  }) = _ProductPageInfo;

  factory ProductPageInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductPageInfoFromJson(json);
}