import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngo_app/features/loan_application/controller/loan_application_controller.dart';

import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:ngo_app/widgets_common/custom_dropdown.dart';

import '../../../../common/const/colors.dart';
import '../../../../common/const/images.dart';



class PersonalInformation extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<String> items = ["Male", "Female"];

  PersonalInformation({
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
              "Complete Your KYC",
              fontWeight: FontWeight.bold,
              size: 24,
              color: AppColors.darkGrey,
            ),
            const SizedBox(height: 10),
            const CustomText(
              "For the purpose of industry regulation, your details are required.",
              fontWeight: FontWeight.w400,
              color: AppColors.darkGrey,
              textAlign: TextAlign.center,
              size: 18,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller.firstNameController,
                        hintText: "First Name"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller.lastNameController,
                        hintText: "Last Name"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Obx(() => CustomDropdown(
                      hintText: ' Select a Gender',
                      items: items,
                      value: controller.selectedGender.value,
                      onChanged: controller.setGender,
                    ))
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                      controller: controller.dobController,
                      hintText: "DOB",
                      suffixIcon: const Icon(Icons.calendar_month_outlined),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2025),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                          controller.dobController.text = formattedDate;
                        }
                      },
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller.fatherHusbandNameController,
                        hintText: "Father/Husband Name"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller.surnameController,
                        hintText: "Surname"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller.occupationFatherController,
                hintText: "Father/Husband Occupation"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller.emailController,
                hintText: "Email Address"
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller.phoneController,
                        hintText: "Phone Number"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller.alternatePhoneController,
                        hintText: "Alternate Phone Number"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller.guardianNameController,
                        hintText: "Guardian Name"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                      controller: controller.guardianPhoneController,
                      hintText: "Guardian Phone Number",
                      keyboardType: TextInputType.number,
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller.relationGuardianController,
                hintText: "Relation With Guardian"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller.occupationController,
                hintText: "Occupation"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller.monthlyIncomeController,
                hintText: "Monthly Income"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller.familyMembersController,
                hintText: "Number of family member"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller.familyDetailsController,
                hintText: "Who are in the family ?"
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
