import 'package:beans_instapay/core/result.dart';
import 'package:beans_instapay/data/data_source/api_test.dart';
import 'package:beans_instapay/domain/model/api_test_data.dart';
import 'package:beans_instapay/domain/repository/api_test_repository.dart';

class ApiTestRepositoryImpl implements ApiTestRepository {
  final dataSource = ApiTest();

  @override
  Future<Result<List<ApiTestData>>> getNoticeList() async {
    return await dataSource.getNoticeList();
  }
}
