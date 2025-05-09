import 'package:dio/dio.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';

Future<ApiResult<T>> apiExecuter<T>(
  Future<T> Function() apiCall,
  String? source,
) async {
  try {
    var result = await apiCall.call();
    return ApiSuccess(data: result);
  } catch (e) {
    if (e is DioException) {
      return ApiError(failure: ServerFailure.fromDioException(e));
    } else {
      return ApiError(failure: ServerFailure(errorMessage: e.toString()));
    }
  }
}
