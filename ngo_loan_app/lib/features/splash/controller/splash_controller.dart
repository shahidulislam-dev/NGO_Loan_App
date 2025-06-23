import 'package:get/get.dart';
import 'package:ngo_app/app_route.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    navigateToWelcomeScreen();
    super.onInit();
    // TODO: implement onInit


  }
  void navigateToWelcomeScreen(){
    Future.delayed(const Duration(seconds: 2), () async{
      Get.offAllNamed(AppRoute.welcomeOne);
    });



  }

}


/*

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pep/features/advisor/advisor_nav_bar/presentation/screens/advisor_nav_bar.dart';
import 'package:pep/features/consumer/nav_bar/presentation/view/consumer_nav_bar.dart';
import 'package:pep/features/onboardings/presentation/view/onboarding_screen_one.dart';

import '../../../core/services/Auth_service.dart';

class SplashController extends GetxController {
  void navigateToOnboardingScreen() {
    Future.delayed(const Duration(seconds: 2), () async {
      // Initialize SharedPreferences
      await AuthService.init();

      // Check if the user is logged in
      if (AuthService.hasToken()) {
        if (AuthService.userRole == "CONSUMER") {
          print('role: ${AuthService.userRole}');
          Get.offAll(() => ConsumerNavBar());
        } else {
          print('role: ${AuthService.userRole}');
          Get.offAll(()=>AdvisorNavBar());
        }


      } else {
        // If not logged in, navigate to Onboarding Screen (First-time users)
        Get.offAll(OnboardingScreenOne());
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    navigateToOnboardingScreen();
  }
}

 */