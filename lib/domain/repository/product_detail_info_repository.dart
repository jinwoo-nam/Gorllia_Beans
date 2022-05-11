import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_detail_page_info.dart';

abstract class ProductDetailInfoRepository {
  Future<Result<ProductDetailPageInfo>> getDripBagDetailPageInfo();
  Future<Result<ProductDetailPageInfo>> getStickCoffeeDetailPageInfo();
  Future<Result<ProductDetailPageInfo>> getCoffeeBeansDetailPageInfo();

}