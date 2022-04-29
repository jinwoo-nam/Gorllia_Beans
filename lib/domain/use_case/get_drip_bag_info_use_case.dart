import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_info.dart';
import 'package:beans_instapay/domain/repository/product_info_repository.dart';

class GetDripBagInfoUseCase {
  ProductInfoRepository repository;

  GetDripBagInfoUseCase(this.repository);

  Future<Result<List<ProductInfo>>> call() async {
    return await repository.getDripBagInfoList();
  }
}
