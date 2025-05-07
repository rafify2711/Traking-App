import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tracking_app/core/config/route_generator.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/provider/app_config_provider.dart';
import 'package:tracking_app/core/utils/application_theme.dart';
import 'package:tracking_app/core/utils/services/screen_size_service.dart';
import 'package:tracking_app/core/utils/services/simple_bloc_observer.dart';
import 'package:tracking_app/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  Bloc.observer = SimpleBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale("_languageCode"),
      assetLoader: const CodegenLoader(),
      child: ChangeNotifierProvider(
        create: (_) => getIt<AppConfigProvider>(),
        child: Tracking(),
        
      ),
    ),
  );
}

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  late AppConfigProvider appConfigProvider;
  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of<AppConfigProvider>(context);
    ScreenSizeService.init(context);
  
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.onBoarding,
      onGenerateRoute: RouteGenerator.onGenerator,
      theme: ApplicationTheme.themeData,
    );
  }
}
