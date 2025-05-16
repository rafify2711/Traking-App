import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/di/di.config.dart';
import 'package:tracking_app/features/orders/data/repository/orders_repo_impl.dart';
import 'package:tracking_app/features/orders/domain/repository/orders_repo.dart';
import 'package:tracking_app/features/orders/domain/use_case/save_order_to_firebase_use_case.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  getIt.init();

  void setup() {
    // Register FirebaseFirestore instance
    getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  }

  // Register Firebase-related dependencies
  // getIt.registerLazySingleton<OrdersRepo>(() => OrdersRepoImpl(getIt()));
  // getIt.registerLazySingleton(() => SaveOrderToFirebaseUseCase(getIt()));
}



