import 'dart:convert';

import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/api_test_data.dart';
import 'package:dio/dio.dart';

class ApiTest {
  static String baseUrl = 'https://api.instapay.kr/v3/feeds';

  ApiTest();

  Future<Result<List<ApiTestData>>> getNoticeList() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('https://api.instapay.kr/v3/feeds');
      final jsonResponse = jsonDecode(response.data);
      Iterable feed = jsonResponse['feeds'];
      List<ApiTestData> noticeList =
          feed.map((e) => ApiTestData.fromJson(e)).toList();
      return Result.success(noticeList);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}
