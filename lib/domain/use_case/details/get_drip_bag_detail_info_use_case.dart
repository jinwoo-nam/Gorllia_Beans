import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/product_detail_page_info.dart';
import 'package:beans_instapay/domain/repository/product_detail_info_repository.dart';

class GetDripBagDetailInfoUseCase {
  ProductDetailInfoRepository repository;

  GetDripBagDetailInfoUseCase(this.repository);

  Future<Result<ProductDetailPageInfo>> call() async {
    return await repository.getDripBagDetailPageInfo();
  }
}