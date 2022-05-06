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
    required List<String> categories,
    required String qrImage_1,
    required String qrImage_2,
    required String qrImage_3,
    required String qrImage_5,
    required String qrImage_10,
    String? dripQrImage_1,
    String? dripQrImage_2,
    String? dripQrImage_3,
    String? dripQrImage_5,
    String? dripQrImage_10,
  }) = _ProductInfo;
  factory ProductInfo.fromJson(Map<String, dynamic> json) => _$ProductInfoFromJson(json);
}