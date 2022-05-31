import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_test_data.freezed.dart';
part 'api_test_data.g.dart';

@freezed
class ApiTestData with _$ApiTestData {
  factory ApiTestData({
    required String ftitle,
    required String fmsg,
    required String adate,
  }) = _ApiTestData;
  factory ApiTestData.fromJson(Map<String, dynamic> json) => _$ApiTestDataFromJson(json);
}