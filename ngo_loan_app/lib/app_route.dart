import 'package:get/get.dart';
import 'package:ngo_app/views/splash_screen/splash_screen.dart';

class AppRoute{
  AppRoute();
  static const String init = "/";

  static List<GetPage> routes = [
    GetPage(name: init, page: ()=>const SplashScreen()),

  ];
}