import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngo_app/features/loan_application/controller/loan_application_controller.dart';


import 'package:ngo_app/widgets_common/custom_button.dart';

import '../../../../common/const/colors.dart';

import '../widget/address_details.dart';
import '../widget/identity_documents.dart';
import '../widget/personal_information.dart';
import '../widget/proof_of_address.dart';


class CompleteKycScreen extends StatelessWidget {
  const CompleteKycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoanApplicationController controller = Get.put(LoanApplicationController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(Icons.arrow_back_ios_new, size: 24),
              ),
            ),
            Expanded(child: _buildStepIcons(controller)),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildStepTitle(controller),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _buildStepContent(controller),
                  const SizedBox(height: 20),
                  Obx(() => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : customButton(
                    onPressed: controller.nextStep,
                    text: controller.currentStep.value == 3 ? 'Submit' : 'Next',
                  )),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIcons(LoanApplicationController controller) {
    final icons = [
      Icons.person_2_outlined,
      Icons.featured_play_list_sharp,
      Icons.list_alt,
      Icons.credit_card_sharp,
    ];

    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: List.generate(icons.length * 2 - 1, (i) {
          if (i.isOdd) {
            int lineIndex = (i - 1) ~/ 2;
            bool isCompletedOrCurrent = (controller.completedSteps[lineIndex] || controller.currentStep.value > lineIndex);
            return Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  gradient: isCompletedOrCurrent ? AppColors.gradientBackground : null,
                  color: isCompletedOrCurrent ? null : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          } else {
            int index = i ~/ 2;
            bool isCurrent = controller.currentStep.value == index;
            bool isCompleted = controller.completedSteps[index];
            double size = isCurrent ? 50 : 20;

            return GestureDetector(
              onTap: () => controller.goToStep(index),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: (isCurrent || isCompleted) ? AppColors.gradientBackground : null,
                  color: (isCurrent || isCompleted) ? null : Colors.grey[300],
                  boxShadow: (isCurrent || isCompleted)
                      ? [const BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))]
                      : null,
                ),
                child: Center(
                  child: isCurrent
                      ? Icon(icons[index], color: Colors.white, size: 30)
                      : isCompleted
                      ? const Icon(Icons.check, color: Colors.white, size: 14)
                      : null,
                ),
              ),
            );
          }
        }),
      ),
    ));
  }

  Widget _buildStepTitle(LoanApplicationController controller) {
    final titles = ["Personal Information", "Identity Documents", "Address Details", "Proof of Address"];
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Text(
        titles[controller.currentStep.value],
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.darkGrey,
        ),
        textAlign: TextAlign.center,
      ),
    ));
  }

  Widget _buildStepContent(LoanApplicationController controller) {
    return Obx(() {
      switch (controller.currentStep.value) {
        case 0:
          return PersonalInformation(formKey: controller.formKeys[0]);
        case 1:
          return IdentityDocuments(formKey: controller.formKeys[1]);
        case 2:
          return AddressDetails(formKey: controller.formKeys[2],);
        case 3:
          return ProofOfAddress(formKey: controller.formKeys[3]);
        default:
          return const SizedBox.shrink();
      }
    });
  }
}
