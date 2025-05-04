import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_app/core/config/route_generator.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/core/provider/app_config_provider.dart';
import 'package:tracking_app/core/utils/application_theme.dart';
import 'package:tracking_app/core/utils/services/screen_size_service.dart';
import 'package:tracking_app/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('_languageCode'),
      assetLoader: const CodegenLoader(),
      child: ChangeNotifierProvider(
        create: (_) => getIt<AppConfigProvider>(),
        child: const Tracking(),
      ),
    ),
  );
}

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
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
