import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';

abstract class AuthRepo {
  Future<ApiResult<ApplyResponse>> apply(ApplyData applyData);
}


