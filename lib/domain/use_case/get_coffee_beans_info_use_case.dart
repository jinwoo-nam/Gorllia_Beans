import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_page_info.dart';
import 'package:beans_instapay/domain/repository/product_info_repository.dart';

class GetCoffeeBeansInfoUseCase {
  ProductInfoRepository repository;

  GetCoffeeBeansInfoUseCase(this.repository);

  Future<Result<ProductPageInfo>> call() async {
    return await repository.getCoffeeBeansPageInfo();
  }
}
