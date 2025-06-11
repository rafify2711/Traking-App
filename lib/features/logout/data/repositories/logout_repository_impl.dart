import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';

import '../../domain/repositories/logout_repository.dart';
import '../datasources/logout_remote_datasource.dart';
@Injectable(as: LogoutRepository)
class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutRemoteDataSource remoteDataSource;

  LogoutRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<String>> logout() async {
    return await remoteDataSource.logout();
  }

}
