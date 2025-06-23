import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ngo_app/views/loan_apply/loan_apply_screen/apply_for_loan_screen.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

import '../../../common/const/colors.dart';
import '../../../common/const/images.dart';

class KycCompletedScreen extends StatelessWidget {
  const KycCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgWidget(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: (){Get.back();},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:  AppColors.darkGrey,
                        width: 2,
                      ),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color:  AppColors.darkGrey,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:  AppColors.appPurpleColor,
                              width: 30,
                            ),
                            color: Colors.white,
                          ),
                        ),

                        Positioned(
                          top: 45,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 58),
                            child: Image.asset(
                              successIcon,
                              height: 300,
                            ),
                          ),
                        ),


                      ],
                    ),
                    const SizedBox(height: 150),
                    const CustomText(
                      "Wow! Your KYC is complete",
                      size: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 150),
                    customButton(onPressed: (){Get.to(const ApplyForLoanScreen());}, text: "Apply Loan")
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
