// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/apply/data/data_source/auth_remote_data_source.dart'
    as _i785;
import '../../features/apply/data/data_source/auth_remote_data_source_impl.dart'
    as _i965;
import '../../features/apply/data/repos/auth_repo_impl.dart' as _i1040;
import '../../features/apply/domain/repos/auth_repo.dart' as _i1051;
import '../../features/apply/domain/use_case/apply_use_case.dart' as _i231;
import '../../features/apply/domain/use_case/get_vehicle_use_case.dart'
    as _i251;
import '../api_manger/api_service.dart' as _i525;
import '../api_manger/dio_module.dart' as _i508;
import '../provider/app_config_provider.dart' as _i291;
import '../utils/services/secure_sotrage_service.dart' as _i665;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i291.AppConfigProvider>(() => _i291.AppConfigProvider());
    gh.singleton<_i665.SecureStorageService>(
      () => _i665.SecureStorageService(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.LogInterceptor>(),
        gh<_i665.SecureStorageService>(),
      ),
    );
    gh.singleton<_i525.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i785.AuthRemoteDataSource>(
      () => _i965.AuthRemoteDataSourceImpl(apiService: gh<_i525.ApiService>()),
    );
    gh.factory<_i1051.AuthRepo>(
      () => _i1040.AuthRepoImpl(
        authRemoteDataSource: gh<_i785.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i231.ApplyUseCase>(
      () => _i231.ApplyUseCase(authRepo: gh<_i1051.AuthRepo>()),
    );
    gh.factory<_i251.GetVehiclesUseCase>(
      () => _i251.GetVehiclesUseCase(gh<_i1051.AuthRepo>()),
    );
    return this;
  }
}

class _$DioModule extends _i508.DioModule {}
