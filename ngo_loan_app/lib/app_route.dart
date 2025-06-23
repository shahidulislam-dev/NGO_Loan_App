import 'package:get/get.dart';
import 'package:ngo_app/features/splash/presentation/screen/splash_screen.dart';
import 'package:ngo_app/features/welcome/presentation/screen/first_welcome_screen.dart';
import 'package:ngo_app/features/welcome/presentation/screen/second_welcome_screen.dart';
import 'package:ngo_app/features/welcome/presentation/screen/third_welcome_screen.dart';

class AppRoute{
  AppRoute();
  static const String init = "/";
  static const String welcomeOne = "/welcomeOne";
  static const String welcomeTwo = "/welcomeTwo";
  static const String welcomeThree = "/welcomeThree";

  static List<GetPage> routes = [
    GetPage(name: init, page: ()=> SplashScreen()),
    GetPage(name: welcomeOne, page: ()=>const FirstWelcomeScreen()),
    GetPage(name: welcomeTwo, page: ()=>const SecondWelcomeScreen()),
    GetPage(name: welcomeThree, page: ()=>const ThirdWelcomeScreen()),

  ];
}