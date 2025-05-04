
import 'dart:developer';

import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/error_handler.dart';

Future<ApiResult<T>> apiExecuter<T>(Future<T> Function<T>() apiCall, String ? source) async {
  try {
    var result = await apiCall.call();
    return ApiSuccess(data: result);
  }on Failure catch (e) {
      return ApiError(failure: e);
    } catch (e) {
      log('$source Error: $e');
      return ApiError(failure: ServerFailure(errorMessage: e.toString()));
    }
  //  catch (e) {
  //     if (e is DioException) {
  //       return ApiError(failure:  ServerFailure.fromDioException(e));
  //     } else {
      
  //       return ApiError( 
  //         failure: ServerFailure(errorMessage: e.toString()));
  //     }
  //   }
}
