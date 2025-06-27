import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngo_app/features/loan_application/controller/loan_application_controller.dart';

import 'package:ngo_app/widgets_common/custom_image_container.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

import '../../../../common/const/colors.dart';
import '../../../../common/const/images.dart';
import '../../../../common/const/styles.dart';



class IdentityDocuments extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ImagePicker _picker = ImagePicker();

  IdentityDocuments({
    required this.formKey,
    super.key,
  });

  Future<void> _pickImage(String type, LoanApplicationController controller) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      controller.setImage(type, File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final LoanApplicationController controller = Get.find<LoanApplicationController>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(boxShadow: [AppTextStyle.commonShadow]),
                  child: Image.asset(identityDocumentImage)),
              const SizedBox(height: 20),
              const CustomText(
                "Upload Identity Document",
                size: 24,
                color: AppColors.fontGrey,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              const CustomText(
                "You can upload any Identity document from the options below, However some require front and back upload. This will help us identify that this is you!",
                size: 18,
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomTextfield(controller: controller.nidNumberController, hintText: "Enter Your NID Number"),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => CustomImageContainer(
                      text: "NID Front Side",
                      icon: Image.asset(idCardIcon),
                      onTap: () => _pickImage('nidFront', controller),
                      height: 120,
                      width: double.infinity,
                      imageFile: controller.nidFront.value,
                    )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Obx(() => CustomImageContainer(
                      text: "NID Back Side",
                      icon: Image.asset(idCardBackIcon),
                      onTap: () => _pickImage('nidBack', controller),
                      height: 120,
                      width: double.infinity,
                      imageFile: controller.nidBack.value,
                    )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CustomText(
                "Or",
                size: 24,
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomTextfield(controller: controller.passportNumberController, hintText: "Enter Your Passport Number"),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => CustomImageContainer(
                      text: "Passport Front",
                      icon: Image.asset(idCardIcon),
                      onTap: () => _pickImage('passportFront', controller),
                      height: 120,
                      width: double.infinity,
                      imageFile: controller.passportFront.value,
                    )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Obx(() => CustomImageContainer(
                      text: "Passport Back",
                      icon: Image.asset(idCardBackIcon),
                      onTap: () => _pickImage('passportBack', controller),
                      height: 120,
                      width: double.infinity,
                      imageFile: controller.passportBack.value,
                    )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextfield(controller: controller.bankAccountController, hintText: "Enter Bank Account Number"),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: CustomTextfield(controller: controller.ifscCodeController, hintText: "IFSC Code")),
                  const SizedBox(width: 10),
                  Expanded(child: CustomTextfield(controller: controller.bankNameController, hintText: "Bank Name")),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() => CustomImageContainer(
                text: "Passbook Photo",
                icon: Image.asset(idCardBackIcon),
                onTap: () => _pickImage('passbook', controller),
                height: 80.00,
                width: double.infinity,
                imageFile: controller.passbook.value,
              )),
              const SizedBox(height: 20),
              const CustomText(
                "Upload Your Passport Photo",
                size: 18,
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Obx(() => GestureDetector(
                onTap: () => _pickImage('passportPhoto', controller),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2.0, color: AppColors.borderColor),
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: controller.passportSizeImage.value != null
                        ? Image.file(
                      controller.passportSizeImage.value!,
                      fit: BoxFit.cover,
                    )
                        : Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            passportImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Icon(
                          Icons.camera_alt,
                          color: Color.fromRGBO(0, 0, 0, 0.7),
                          size: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
