import 'package:beans_instapay/core/result.dart';

abstract class GetCartQrRepository {
  Future<Result<List<String>>> getCartQrCode(String price, String serial);
}