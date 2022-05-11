import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/domain/repository/product_detail_info_repository.dart';

class GetStickCoffeeDetailInfoUseCase {
  ProductDetailInfoRepository repository;

  GetStickCoffeeDetailInfoUseCase(this.repository);

  Future<Result<ProductDetailPageInfo>> call() async {
    return await repository.getStickCoffeeDetailPageInfo();
  }
}