import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/logout/data/datasources/logout_remote_datasource.dart';
@Injectable(as: LogoutRemoteDataSource)
class LogoutRemoteDataSourceImpl implements LogoutRemoteDataSource {
  ApiService apiService;
  LogoutRemoteDataSourceImpl({required this.apiService});
  @override
  Future<ApiResult<String>> logout() {
  return apiExecuter(() async => await apiService.logout(), 'LogoutRemoteDataSourceImpl');
  }
}