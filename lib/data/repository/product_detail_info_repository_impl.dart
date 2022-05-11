import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/data/data_source/product_info_data_source.dart';
import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/domain/repository/product_detail_info_repository.dart';

class ProductDetailInfoRepositoryImpl implements ProductDetailInfoRepository {
  final dataSource = ProductInfoDataSource();

  @override
  Future<Result<ProductDetailPageInfo>> getDripBagDetailPageInfo() {
    return dataSource.getDripBagDetailInfo();
  }

  @override
  Future<Result<ProductDetailPageInfo>> getStickCoffeeDetailPageInfo() {
    return dataSource.getStickCoffeeDetailInfo();
  }

  @override
  Future<Result<ProductDetailPageInfo>> getCoffeeBeansDetailPageInfo() {
    return dataSource.getCoffeeBeansDetailInfo();
  }
}
