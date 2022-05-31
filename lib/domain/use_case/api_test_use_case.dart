import 'package:beans_instapay/domain/repository/api_test_repository.dart';

import '../../core/result.dart';
import '../model/api_test_data.dart';

class ApiTestUseCase {
  ApiTestRepository repository;

  ApiTestUseCase(this.repository);

  Future<Result<List<ApiTestData>>> call() async {
    return await repository.getNoticeList();
  }
}
