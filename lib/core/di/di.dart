import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void setup(){
  // Register FirebaseFirestore instance
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
}
void configureDependencies() => getIt.init();


