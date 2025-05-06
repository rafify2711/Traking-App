import 'package:tracking_app/features/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';

abstract class AuthRemoteDataSource {
  Future<ApplyResponse> apply(ApplyData applyData);
}
