import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:ngo_app/features/authentication/controller/sign_up_controller.dart';
import 'package:ngo_app/features/authentication/controller/signin_controller.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:ngo_app/common/const/colors.dart';
import 'package:ngo_app/common/const/strings.dart';
import 'package:ngo_app/common/const/styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final SignUpController controller = Get.find<SignUpController>();
  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    DateTime? lastBackPressTime;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          DateTime now = DateTime.now();
          if (lastBackPressTime == null ||
              now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
            lastBackPressTime = now;
            Fluttertoast.showToast(
              msg: "Press back again to exit",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
            );
          } else {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: bgWidget(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
                vertical: size.height * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // App Title
                  Text(
                    loan,
                    style: TextStyle(
                      fontSize: size.height * 0.06,
                      fontFamily: AppTextStyle.bold,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),

                  // Heading
                  Text(
                    signInto,
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontFamily: AppTextStyle.bold,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),

                  // Subheading
                  Text(
                    signInWithMobil,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),

                  // Mobile field
                  CustomTextfield(
                    controller: signInController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: mobileHint,
                    prefixIcon: Icon(
                      Icons.email,
                      size: size.height * 0.03,
                      color: AppColors.iconColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),

                  // Password field
                  Obx(
                        () => CustomTextfield(
                      controller: signInController.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      hintText: "Enter Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        size: size.height * 0.03,
                        color: AppColors.iconColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.iconColor,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),

                  // Login Button
                  Obx(() => signInController.isLoading.value
                      ? const CircularProgressIndicator(color: AppColors.white)
                      : customButton(
                    onPressed: () {
                      signInController.loginUser(
                        email: signInController.emailController.text.trim(),
                        password: signInController.passwordController.text.trim(),
                      );
                    },
                    text: "Login",
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
