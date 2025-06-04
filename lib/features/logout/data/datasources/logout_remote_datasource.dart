import 'package:tracking_app/core/base/api_result.dart';

abstract class LogoutRemoteDataSource {
  Future<ApiResult<String>>logout();
}
