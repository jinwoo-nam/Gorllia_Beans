import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_info.freezed.dart';
part 'product_info.g.dart';

@freezed
class ProductInfo with _$ProductInfo {
  factory ProductInfo({
    required String imageUrl,
    required String name,
    required String price,
    required String cupNote,
    required String description,
  }) = _ProductInfo;
  factory ProductInfo.fromJson(Map<String, dynamic> json) => _$ProductInfoFromJson(json);
}