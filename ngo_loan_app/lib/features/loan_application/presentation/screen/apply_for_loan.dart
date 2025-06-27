import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/const/colors.dart';
import '../../../../views/loan_apply/loan_apply_screen/loan_eligibility_screen.dart';
import '../../../../widgets_common/custom_button.dart';
import '../../../../widgets_common/custom_radio.dart';
import '../../../../widgets_common/custom_text.dart';
import '../../../../widgets_common/custom_textfield.dart';
import '../../controller/apply_loan_controller.dart';


class ApplyForLoanScreen extends StatelessWidget {
  ApplyForLoanScreen({super.key});

  final LoanController loanController = Get.put(LoanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          "Apply For Loan",
          size: 17,
          fontWeight: FontWeight.w700,
          color: AppColors.darkGrey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const CustomText(
                      "How much do you want to borrow?",
                      size: 16,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: loanController.amountController,
                      hintText: "30,000",
                      prefixIcon: const Icon(Icons.currency_pound),
                    ),
                    const SizedBox(height: 5),
                    const CustomText(
                      "You have a minimum of N30,000",
                      color: Color(0xFFF56C2A),
                      size: 12,
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      "Why are you want loan?",
                      size: 16,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: loanController.reasonController,
                      hintText: "Because I am very very poor",
                    ),
                    const SizedBox(height: 5),
                    const CustomText(
                      "You have a maximum of 24 months",
                      color: Color(0xFFF56C2A),
                      size: 12,
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      "Have you any running loan?",
                      size: 16,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Obx(() => Row(
                        children: [
                          customRadio("Yes", loanController.existingLoan.value, (val) {
                            loanController.existingLoan.value = val;
                          }),
                          const SizedBox(width: 20),
                          customRadio("No", loanController.existingLoan.value, (val) {
                            loanController.existingLoan.value = val;
                          }),
                        ],
                      )),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Obx(() => loanController.isLoading.value
                ? const CircularProgressIndicator()
                : customButton(
              onPressed: () async {
                await loanController.applyForLoan();
                Get.to(const LoanEligibilityScreen());
              },
              text: "Apply",
            )),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
