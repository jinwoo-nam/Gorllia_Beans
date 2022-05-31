import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/domain/model/api_test_data.dart';

abstract class ApiTestRepository {
  Future<Result<List<ApiTestData>>> getNoticeList();
}
