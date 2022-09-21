import 'package:beans_instapay/core/result.dart';

abstract class GetCartQrRepository {
  Future<Result<String>> getCartQrCode(String price, String serial);
}