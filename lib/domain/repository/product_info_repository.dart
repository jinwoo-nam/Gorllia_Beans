import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_page_info.dart';

abstract class ProductInfoRepository {
  Future<Result<ProductPageInfo>> getDripBagPageInfo();
  Future<Result<ProductPageInfo>> getStickCoffeeInfo();
}