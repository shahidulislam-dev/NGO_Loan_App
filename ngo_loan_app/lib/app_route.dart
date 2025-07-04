import 'package:get/get.dart';
import 'package:ngo_app/features/authentication/presentation/screen/registration_screen.dart';
import 'package:ngo_app/features/profile/presentation/screen/edit_profile_screen.dart';
import 'package:ngo_app/features/profile/presentation/screen/profile_screen.dart';
import 'package:ngo_app/features/splash/presentation/screen/splash_screen.dart';
import 'package:ngo_app/features/welcome/presentation/screen/first_welcome_screen.dart';
import 'package:ngo_app/features/welcome/presentation/screen/second_welcome_screen.dart';
import 'package:ngo_app/features/welcome/presentation/screen/third_welcome_screen.dart';


import 'features/authentication/presentation/screen/login_screen.dart';
import 'features/home/presentation/screen/home_screen.dart';

class AppRoute{
  AppRoute();
  static const String init = "/";
  static const String welcomeOne = "/welcomeOne";
  static const String welcomeTwo = "/welcomeTwo";
  static const String welcomeThree = "/welcomeThree";
  static const String registration = "/registration";
  static const String login = "/login";
  static const String home = "/home";
  static const String profile = "/profile";
  static const String editProfile = "/editProfile";

  static List<GetPage> routes = [
    GetPage(name: init, page: ()=> SplashScreen()),
    GetPage(name: welcomeOne, page: ()=>const FirstWelcomeScreen()),
    GetPage(name: welcomeTwo, page: ()=>const SecondWelcomeScreen()),
    GetPage(name: welcomeThree, page: ()=>const ThirdWelcomeScreen()),
    GetPage(name: registration, page: ()=>RegistrationScreen()),
    GetPage(name: login, page: ()=> LoginScreen()),
    GetPage(name: home, page: ()=>HomeScreen()),
    GetPage(name: profile, page: ()=>ProfileScreen()),
    GetPage(name: editProfile, page: ()=>EditProfileScreen())

  ];
}