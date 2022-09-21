import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/data/data_source/beans_api.dart';
import 'package:beans_instapay/domain/repository/get_cart_qr_repository.dart';

class GetCartQrRepositoryImpl implements GetCartQrRepository {
  final dataSource = BeansApi();

  @override
  Future<Result<List<String>>> getCartQrCode(String price, String serial) async {
    return await dataSource.getCartQrCode(price, serial);
  }
}
