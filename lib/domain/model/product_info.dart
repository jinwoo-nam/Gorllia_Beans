import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_info.freezed.dart';
part 'product_info.g.dart';

@freezed
class ProductInfo with _$ProductInfo {
  factory ProductInfo({
    required String imageUrl,
    required String name,
    required int price,
    required double dcRate,
    required int shippingFee,
    required String cupNote,
    required String description,
    required List<String> categories,
    required String qrImage_1,
    required String qrImage_2,
    required String qrImage_3,
    required String qrImage_5,
    required String qrImage_10,
    required String qrImage_1_Url,
    required int sourness,
    required int sweet,
    required int bitterness,
    required int bodyTaste,
    required bool isBean,

    String? dripQrImage_1,
    String? dripQrImage_2,
    String? dripQrImage_3,
    String? dripQrImage_5,
    String? dripQrImage_10,
    String? dripQrImage_1_Url,
  }) = _ProductInfo;
  factory ProductInfo.fromJson(Map<String, dynamic> json) => _$ProductInfoFromJson(json);
}