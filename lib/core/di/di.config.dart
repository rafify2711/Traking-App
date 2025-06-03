// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/apply/data/data_source/auth_remote_data_source.dart'
    as _i143;
import '../../features/auth/apply/data/data_source/auth_remote_data_source_impl.dart'
    as _i287;
import '../../features/auth/apply/data/repos/auth_repo_impl.dart' as _i802;
import '../../features/auth/apply/domain/repos/auth_repo.dart' as _i981;
import '../../features/auth/apply/domain/use_case/apply_use_case.dart' as _i351;
import '../../features/auth/apply/domain/use_case/get_vehicle_use_case.dart'
    as _i729;
import '../../features/auth/forget_password/data/data_source/forget_password_data_source_impl.dart'
    as _i224;
import '../../features/auth/forget_password/data/repo/forget_password_repo_impl.dart'
    as _i610;
import '../../features/auth/forget_password/domain/data_source/forget_password_data_source.dart'
    as _i762;
import '../../features/auth/forget_password/domain/repo/forget_password_repo.dart'
    as _i484;
import '../../features/auth/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i913;
import '../../features/auth/forget_password/domain/use_cases/reset_password_use_case.dart'
    as _i22;
import '../../features/auth/forget_password/domain/use_cases/sen_verify_code_use_case.dart'
    as _i318;
import '../../features/auth/login/data/data_source/login_remote_data_source.dart'
    as _i520;
import '../../features/auth/login/data/data_source/login_remote_data_source_imp.dart'
    as _i1015;
import '../../features/auth/login/data/repository_implementation/login_repository_implementation.dart'
    as _i268;
import '../../features/auth/login/domain/repository_icontract/login_contract.dart'
    as _i96;
import '../../features/auth/login/domain/usecases/login_usecase.dart' as _i401;
import '../../features/home/data/data%20source/home_screen_data_source.dart'
    as _i428;
import '../../features/home/data/data%20source/home_screen_data_source_imp.dart'
    as _i885;
import '../../features/home/data/repo/home_screen_repo_imp.dart' as _i924;
import '../../features/home/domain/repo/home_screen_repo.dart' as _i202;
import '../../features/home/domain/use_case/get_all_pending_orders_use_case.dart'
    as _i968;
import '../../features/home/domain/use_case/get_orderdetails_from_firebase.dart'
    as _i136;
import '../../features/home/domain/use_case/start_order_use_case.dart' as _i587;
import '../../features/order_status/data/data_source/OrderStatusRemoteDataSource.dart'
    as _i404;
import '../../features/order_status/data/data_source/OrderStatusRemoteDataSourceImpl.dart'
    as _i102;
import '../../features/order_status/data/repo/order_repo_impl.dart' as _i928;
import '../../features/order_status/domain/repo/order_repo.dart' as _i716;
import '../../features/order_status/domain/use_case/update_order-status_use_case.dart'
    as _i719;
import '../../features/orders/data/repository/orders_repo_impl.dart' as _i849;
import '../../features/orders/domain/repository/orders_repo.dart' as _i132;
import '../../features/orders/domain/use_case/save_order_to_firebase_use_case.dart'
    as _i73;
import '../../features/profile/data/data_source/profile_remote_data_source.dart'
    as _i998;
import '../../features/profile/data/data_source/profile_remote_data_source_impl.dart'
    as _i531;
import '../../features/profile/data/repos/profile_repo_impl.dart' as _i1072;
import '../../features/profile/domain/repos/profile_repo.dart' as _i1007;
import '../../features/profile/domain/use_case/get_logged_driver_data_use_case.dart'
    as _i440;
import '../../features/profile/domain/use_case/get_vechile_name_use_case.dart'
    as _i668;
import '../api_manger/api_service.dart' as _i525;
import '../api_manger/dio_module.dart' as _i508;
import '../provider/app_config_provider.dart' as _i291;
import '../utils/services/fire_store_module.dart' as _i81;
import '../utils/services/secure_sotrage_service.dart' as _i665;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final firestoreModule = _$FirestoreModule();
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i291.AppConfigProvider>(() => _i291.AppConfigProvider());
    gh.singleton<_i665.SecureStorageService>(
      () => _i665.SecureStorageService(),
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firestoreModule.firestore);
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.LogInterceptor>(),
        gh<_i665.SecureStorageService>(),
      ),
    );
    gh.factory<_i132.OrdersRepo>(
      () => _i849.OrdersRepoImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i73.SaveOrderToFirebaseUseCase>(
      () => _i73.SaveOrderToFirebaseUseCase(gh<_i132.OrdersRepo>()),
    );
    gh.singleton<_i525.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i404.OrderStatusRemoteDataSource>(
      () => _i102.OrderRemoteDataSourceImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i525.ApiService>(),
        gh<_i665.SecureStorageService>(),
      ),
    );
    gh.factory<_i998.ProfileRemoteDataSource>(
      () =>
          _i531.ProfileRemoteDataSourceImpl(apiService: gh<_i525.ApiService>()),
    );
    gh.factory<_i1007.ProfileRepo>(
      () => _i1072.ProfileRepoImpl(gh<_i998.ProfileRemoteDataSource>()),
    );
    gh.factory<_i520.LoginRemoteDataSource>(
      () => _i1015.LoginRemoteDataSourceImp(apiService: gh<_i525.ApiService>()),
    );
    gh.factory<_i143.AuthRemoteDataSource>(
      () => _i287.AuthRemoteDataSourceImpl(apiService: gh<_i525.ApiService>()),
    );
    gh.factory<_i428.HomeScreenDataSource>(
      () => _i885.HomeScreenDataSourceImp(
        gh<_i525.ApiService>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i440.GetLoggedDriverDataUseCase>(
      () => _i440.GetLoggedDriverDataUseCase(gh<_i1007.ProfileRepo>()),
    );
    gh.factory<_i668.GetVechileNameUseCase>(
      () => _i668.GetVechileNameUseCase(gh<_i1007.ProfileRepo>()),
    );
    gh.factory<_i762.ForgetPasswordDataSource>(
      () => _i224.ForgetPasswordDataSourceImpl(gh<_i525.ApiService>()),
    );
    gh.factory<_i981.AuthRepo>(
      () => _i802.AuthRepoImpl(
        authRemoteDataSource: gh<_i143.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i202.HomeScreenRepo>(
      () => _i924.HomeScreenRepoImp(gh<_i428.HomeScreenDataSource>()),
    );
    gh.factory<_i716.OrderRepository>(
      () => _i928.OrderRepoImpl(gh<_i404.OrderStatusRemoteDataSource>()),
    );
    gh.factory<_i351.ApplyUseCase>(
      () => _i351.ApplyUseCase(authRepo: gh<_i981.AuthRepo>()),
    );
    gh.factory<_i484.ForgetPasswordRepo>(
      () => _i610.ForgetPasswordRepoImpl(
        dataSource: gh<_i762.ForgetPasswordDataSource>(),
      ),
    );
    gh.factory<_i96.LoginContract>(
      () => _i268.LoginRepositoryImplementation(
        loginRemoteDataSource: gh<_i520.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i401.LoginUsecase>(
      () => _i401.LoginUsecase(login_repo: gh<_i96.LoginContract>()),
    );
    gh.factory<_i719.UpdateOrderStatusUseCase>(
      () => _i719.UpdateOrderStatusUseCase(gh<_i716.OrderRepository>()),
    );
    gh.factory<_i968.GetAllPendingOrdersUseCase>(
      () => _i968.GetAllPendingOrdersUseCase(gh<_i202.HomeScreenRepo>()),
    );
    gh.factory<_i587.StartOrderUseCase>(
      () => _i587.StartOrderUseCase(gh<_i202.HomeScreenRepo>()),
    );
    gh.factory<_i136.GetOrderdetailsFromFirebase>(
      () => _i136.GetOrderdetailsFromFirebase(gh<_i202.HomeScreenRepo>()),
    );
    gh.factory<_i318.SenVerifyCodeUseCase>(
      () => _i318.SenVerifyCodeUseCase(repo: gh<_i484.ForgetPasswordRepo>()),
    );
    gh.factory<_i913.ForgetPasswordUseCase>(
      () => _i913.ForgetPasswordUseCase(gh<_i484.ForgetPasswordRepo>()),
    );
    gh.factory<_i22.ResetPasswordUseCase>(
      () => _i22.ResetPasswordUseCase(gh<_i484.ForgetPasswordRepo>()),
    );
    gh.factory<_i729.GetVehiclesUseCase>(
      () => _i729.GetVehiclesUseCase(gh<_i981.AuthRepo>()),
    );
    return this;
  }
}

class _$DioModule extends _i508.DioModule {}

class _$FirestoreModule extends _i81.FirestoreModule {}
