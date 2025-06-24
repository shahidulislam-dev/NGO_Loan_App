import 'package:get/get.dart';
import 'package:ngo_app/app_route.dart';
import 'package:ngo_app/features/authentication/controller/sign_up_controller.dart';

import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_checkbox.dart';

import 'package:ngo_app/widgets_common/custom_textfield.dart';

import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/district_dropdown.dart';
import 'package:flutter/material.dart';

import '../../../../common/const/colors.dart';
import '../../../../common/const/strings.dart';
import '../../../../common/const/styles.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final SignUpController controller = Get.find<SignUpController>();

  bool? isSelected = true;

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: bgWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.03,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.02),
                  CustomText(
                    loan,
                    size: size.height * 0.05, // title size
                    fontFamily: AppTextStyle.bold,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  SizedBox(height: size.height * 0.015),
                  CustomText(
                    register,
                    size: size.height * 0.03,
                    fontFamily: AppTextStyle.bold,
                    color: AppColors.white,
                  ),
                  SizedBox(height: size.height * 0.015),
                  CustomText(
                    registerMsg,
                    size: size.height * 0.02,
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.04),

                  /// Full Name
                  CustomTextfield(
                    controller: controller.fullNameController,
                    hintText: nameHint,
                    prefixIcon: Icon(Icons.person,
                        color: AppColors.iconColor, size: size.width * 0.08),
                  ),
                  SizedBox(height: size.height * 0.025),

                  /// Email
                  CustomTextfield(
                    controller: controller.emailController,
                    hintText: mobileHint,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email,
                        color: AppColors.iconColor, size: size.width * 0.08),
                  ),
                  SizedBox(height: size.height * 0.025),

                  /// Password
                  Obx(() => CustomTextfield(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.lock,
                        color: AppColors.iconColor,
                        size: size.width * 0.08),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.iconColor,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  )),
                  SizedBox(height: size.height * 0.025),

                  /// District
                  DistrictDropdown(),
                  SizedBox(height: size.height * 0.025),

                  /// Gender Row
                  Row(
                    children: [
                      CustomText(
                        gender,
                        color: AppColors.white,
                        fontFamily: AppTextStyle.bold,
                        size: size.height * 0.022,
                      ),
                      SizedBox(width: size.width * 0.05),
                      Container(
                        height: size.height * 0.025,
                        width: size.height * 0.025,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.gradientBackground,
                          border:
                          Border.all(color: AppColors.white, width: 2),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      CustomText(
                        female,
                        color: AppColors.white,
                        fontFamily: AppTextStyle.semibold,
                        size: size.height * 0.02,
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.025),
                  const CustomCheckbox(labelText: policy),
                  SizedBox(height: size.height * 0.04),

                  /// Submit
                  Obx(() => controller.isLoading.value
                      ? const CircularProgressIndicator(
                      color: AppColors.white)
                      : customButton(
                    onPressed: controller.registerUser,
                    text: "Continue",
                  )),
                  SizedBox(height: size.height * 0.02),

                  /// Already have account
                  TextButton(
                    onPressed: () => Get.toNamed(AppRoute.login),
                    child: CustomText(
                      "Already have an account?",
                      color: AppColors.white,
                      fontFamily: AppTextStyle.bold,
                      size: size.height * 0.02,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
