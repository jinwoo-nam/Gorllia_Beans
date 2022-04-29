import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_info.dart';

abstract class ProductInfoRepository {
  Future<Result<List<ProductInfo>>> getDripBagInfoList();
}