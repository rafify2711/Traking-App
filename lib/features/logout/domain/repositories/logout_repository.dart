import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';

abstract class LogoutRepository {
  // TODO: Define repository methods
  Future<ApiResult<String>> logout();
}
