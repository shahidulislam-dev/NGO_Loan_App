

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_route.dart';
import 'common/binding/controller_binder.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    /*AppSizes().init(context);*/
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,


      locale: Get.deviceLocale, // Device locale or dynamically updated locale
      ///initialRoute: AppRoute.quizScreen,
      initialRoute: AppRoute.init,



      //translations: Language(),
      ///fallbackLocale: Locale('en', "US"),
      getPages: AppRoute.routes,
      initialBinding: ControllerBinder(),
      themeMode: ThemeMode.light,
      //theme: AppTheme.lightTheme,
    );

  }
}