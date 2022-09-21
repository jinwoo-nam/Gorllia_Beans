import 'package:beans_instapay/core/result.dart';
import 'package:dio/dio.dart';

const String beansBaseUrl = 'https://api.instapay.kr/v3/beans';

class BeansApi {
  Future<Result<List<String>>> getCartQrCode(
      String price, String serial) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio
          .get(beansBaseUrl, queryParameters: {'p': price, 'g': serial});
      List<String> res = [];
      res.add(response.data['qr']);
      res.add(response.data['re']);
      return Result.success(res);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}
