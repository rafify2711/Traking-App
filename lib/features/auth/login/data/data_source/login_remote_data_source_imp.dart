import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/login/data/data_source/login_remote_data_source.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  final ApiService apiService;
  LoginRemoteDataSourceImp({required this.apiService});

  @override
  Future<ApiResult<LoginResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    // return apiExecuter<LoginResponse>(() async{
    //   return response;
    // },"");
    return apiExecuter<LoginResponse>(() async {
      var response = await apiService.loginUser(loginRequest);

      return response;
    }, "");
  }
}
