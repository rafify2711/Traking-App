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
    gh.singleton<_i291.AppConfigProvider>(() => _i291.AppConfigProvider());
    gh.singleton<_i665.SecureStorageService>(
      () => _i665.SecureStorageService(),
    );
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.LogInterceptor>(),
        gh<_i665.SecureStorageService>(),
      ),
    );
    gh.singleton<_i525.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    return this;
  }
}

class _$DioModule extends _i508.DioModule {}
