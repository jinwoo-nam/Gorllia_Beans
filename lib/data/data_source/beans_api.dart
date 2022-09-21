import 'dart:convert';

import 'package:beans_instapay/core/result.dart';
import 'package:dio/dio.dart';

const String beansBaseUrl = 'https://api.instapay.kr/v3/beans';

class BeansApi {
  Future<Result<String>> getCartQrCode(String price, String serial) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio
          .get(beansBaseUrl, queryParameters: {'p': price, 'g': serial});
      return Result.success(response.data['qr']);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}
