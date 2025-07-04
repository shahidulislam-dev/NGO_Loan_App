

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngo_app/features/loan_application/controller/loan_application_controller.dart';
import 'package:ngo_app/widgets_common/custom_checkbox.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

import '../../../../common/const/colors.dart';
import '../../../../common/const/images.dart';



class AddressDetails extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AddressDetails({
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoanApplicationController controller = Get.find<LoanApplicationController>();

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Image.asset(completeProfileImage),
            const SizedBox(height: 20),
            const CustomText(
              "Complete Your Address Details",
              fontWeight: FontWeight.bold,
              size: 24,
              color: AppColors.darkGrey,
            ),
            const SizedBox(height: 10),
            const CustomText(
              "For the purpose of industry regulation, your address details are required.",
              fontWeight: FontWeight.w400,
              color: AppColors.darkGrey,
              textAlign: TextAlign.center,
              size: 18,
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                "Present Address",
                fontWeight: FontWeight.w800,
                color: AppColors.darkGrey,
                textAlign: TextAlign.start,
                size: 20,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextfield(
                controller: controller.presentHouseController,
                hintText: "House/Road No or Village"
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller.presentThanaController,
                        hintText: "Thana"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller.presentPostOfficeController,
                        hintText: "Post Office"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller.presentPostCodeController,
                        hintText: "Post Code"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller.presentDistrictController,
                        hintText: "District"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                "Permanent Address",
                fontWeight: FontWeight.w800,
                color: AppColors.darkGrey,
                textAlign: TextAlign.start,
                size: 20,
              ),
            ),
            const SizedBox(height: 10),
            Obx(() => CustomCheckbox(
              labelText: "Permanent address is same as present address",
              initialValue: controller.isSameAddressChecked.value,
              onChanged: (value) {
                controller.toggleSameAddress(value);
              },
            )),

            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller.permanentHouseController,
                hintText: "House/Road No or Village"
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller.permanentThanaController,
                        hintText: "Thana"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller.permanentPostOfficeController,
                        hintText: "Post Office"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller.permanentPostCodeController,
                        hintText: "Post Code"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller.permanentDistrictController,
                        hintText: "District"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(text: 'By continuing, you are acknowledging that you have read, understood and agreed to the KYC\'s '),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: const TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
