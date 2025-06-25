import 'package:get/get.dart';
import 'package:ngo_app/app_route.dart';
import 'package:ngo_app/features/navbar/presentation/nav_bar.dart';



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
      Get.offAll(() => NavBar());
    } else {
      // No session found, go to welcome
      Get.offAllNamed(AppRoute.welcomeOne);
    }
  }
}
