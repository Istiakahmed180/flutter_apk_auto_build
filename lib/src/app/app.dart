import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/bindings/initial_bindings.dart';
import 'package:yumio/src/app/config/theme/dark_theme.dart';
import 'package:yumio/src/app/config/theme/light_theme.dart';
import 'package:yumio/src/app/contants/app_strings.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/app/routes/routes_handler.dart';

class Yumio extends StatelessWidget {
  const Yumio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 600),
      themeMode: ThemeMode.light,
      theme: LightTheme().lightTheme(context),
      darkTheme: DarkTheme().darkTheme(context),
      getPages: routesHandler,
      initialRoute: BaseRoute.splash,
    );
  }
}
