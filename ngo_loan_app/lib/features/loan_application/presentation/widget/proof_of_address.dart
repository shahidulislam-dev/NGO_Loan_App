import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngo_app/features/loan_application/controller/loan_application_controller.dart';

import 'package:ngo_app/widgets_common/custom_dropdown.dart';
import 'package:ngo_app/widgets_common/custom_image_container.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:ngo_app/widgets_common/district_dropdown.dart';

import '../../../../common/const/colors.dart';
import '../../../../common/const/images.dart';
import '../../../../common/const/styles.dart';


class ProofOfAddress extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<String> items = ["Bank Statement", "Utility Bill", "Electricity Bill", "Tax Receipt"];
  final ImagePicker _picker = ImagePicker();

  ProofOfAddress({
    required this.formKey,
    super.key,
  });

  Future<void> _pickAddressProofImage(LoanApplicationController controller) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      controller.setImage('addressProof', File(picked.path));
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
                  "Upload Proof Of Address",
                  size: 24,
                  color: AppColors.fontGrey,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 10),
                const CustomText(
                  "This will also help us identify that it is you running this account",
                  size: 18,
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CustomTextfield(controller: controller.residentialAddressController, hintText: "Residential Address"),
                const SizedBox(height: 20),
                DistrictDropdown(),
                /*Obx(() => DistrictDropdown(
                  value: controller.selectedDistrict.value,
                  onChanged: controller.setDistrict,
                )),*/
                const SizedBox(height: 20),
                const CustomText("Select Proof of Address Document type", size: 20, color: AppColors.fontGrey, fontWeight: FontWeight.w400),
                const SizedBox(height: 20),
                Obx(() => CustomDropdown(
                  hintText: ' Select a Option',
                  items: items,
                  value: controller.selectedProofType.value,
                  onChanged: controller.setProofType,
                )),
                const SizedBox(height: 20),
                Obx(() => CustomImageContainer(
                  text: "Proof Of Address",
                  icon: Image.asset(proofAddressImage),
                  onTap: () => _pickAddressProofImage(controller),
                  height: 100,
                  width: double.infinity,
                  imageFile: controller.addressProof.value,
                )),
                const SizedBox(height: 10),
                const CustomText("Acceptable Utility Bill / Bank Statement must be within 6 months", size: 16, color: AppColors.darkGrey, fontWeight: FontWeight.w400)
              ],
            ),
          )
      ),
    );
  }
}
