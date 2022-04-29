import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_page_info.dart';
import 'package:beans_instapay/domain/repository/product_info_repository.dart';

class GetStickCoffeeInfoUseCase {
  ProductInfoRepository repository;

  GetStickCoffeeInfoUseCase(this.repository);

  Future<Result<ProductPageInfo>> call() async {
    return await repository.getStickCoffeeInfo();
  }
}
