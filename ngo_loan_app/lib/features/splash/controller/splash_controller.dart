import 'package:get/get.dart';
import 'package:ngo_app/app_route.dart';

import 'package:ngo_app/views/home/home_screen.dart';

import '../../../common/service/session_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkSessionAndNavigate();
  }

  void _checkSessionAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));


    if (SessionService.hasSession()) {
      // User already logged in
      Get.offAll(() => const HomeScreen());
    } else {
      // No session found, go to welcome
      Get.offAllNamed(AppRoute.welcomeOne);
    }
  }
}
