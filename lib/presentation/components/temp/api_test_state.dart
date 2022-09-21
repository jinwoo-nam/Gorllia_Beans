import 'package:beans_instapay/domain/model/api_test_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_test_state.freezed.dart';
part 'api_test_state.g.dart';

@freezed
class ApiTestState with _$ApiTestState {
  factory ApiTestState({
    @Default([]) List<ApiTestData> notice,

  }) = _ApiTestState;
  factory ApiTestState.fromJson(Map<String, dynamic> json) => _$ApiTestStateFromJson(json);
}