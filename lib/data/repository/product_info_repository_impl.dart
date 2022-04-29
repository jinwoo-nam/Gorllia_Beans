import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/data/data_source/product_info_data_source.dart';
import 'package:beans_instapay/domain/model/product_page_info.dart';
import 'package:beans_instapay/domain/repository/product_info_repository.dart';

class ProductInfoRepositoryImpl implements ProductInfoRepository {
  final dataSource = ProductInfoDataSource();

  @override
  Future<Result<ProductPageInfo>> getDripBagPageInfo() async {
    return await dataSource.getDripBagInfo();
  }

  @override
  Future<Result<ProductPageInfo>> getStickCoffeePageInfo() async {
    return await dataSource.getStickCoffeeInfo();
  }

  @override
  Future<Result<ProductPageInfo>> getCoffeeBeansPageInfo() async{
    return await dataSource.getCoffeeBeansInfo();
  }
}
