import 'package:get/get.dart';
import 'package:ngo_app/features/authentication/controller/sign_up_controller.dart';
import 'package:ngo_app/features/donate/controller/donation_controller.dart';
import 'package:ngo_app/features/loan_application/controller/apply_loan_controller.dart';
import 'package:ngo_app/features/loan_application/controller/loan_application_controller.dart';
import 'package:ngo_app/features/profile/controller/profile_controller.dart';

class ControllerBinder extends Bindings{


  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignUpController>(()=>SignUpController(), fenix: true);
    Get.lazyPut<ProfileController>(()=>ProfileController(), fenix: true);
    Get.lazyPut<DonationController>(()=>DonationController(), fenix: true);
    Get.lazyPut<LoanApplicationController>(()=>LoanApplicationController(), fenix: true);
    Get.lazyPut<LoanController>(()=>LoanController(), fenix: true);
  }
}