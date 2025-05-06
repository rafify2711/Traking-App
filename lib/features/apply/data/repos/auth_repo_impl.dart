import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/apply/data/data_source/auth_remote_data_source.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/apply/domain/repos/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<ApiResult<ApplyResponse>> apply(ApplyData applyData)async {
  return await apiExecuter<ApplyResponse>(
      ()=> authRemoteDataSource.apply(applyData),
      " Error AuthRepoImpl apply method",
    );
  }
}
