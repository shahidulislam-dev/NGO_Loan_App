import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:ngo_app/features/navbar/presentation/nav_bar.dart';

import 'package:ngo_app/views/loan_apply/loan_apply_screen/apply_completed_screen.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button_two.dart';
import 'package:ngo_app/widgets_common/custom_checkbox.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/score_circle.dart';

import '../../../../../../common/const/colors.dart';

class ExamScoreEligibility extends StatelessWidget {
  final int score;
  final int total;

  const ExamScoreEligibility({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgWidget(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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

                  const SizedBox(height: 10),
                  ScoreCircle(
                    score: score,
                    total: total,
                    progressColor:  AppColors.green,
                    backgroundColor: Colors.white,
                    size: 150,
                    textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                  ),

                  const SizedBox(height: 20),
                  CustomText("Your Qualify examination your score is $score / $total", size: 14, fontWeight: FontWeight.w700, color: Colors.white, ),
                  const SizedBox(height: 15),
                  CustomText("$score / $total", size: 14, fontWeight: FontWeight.w700, color: Colors.white, ),
                  const SizedBox(height: 5),
                  const CustomText("Congrats! You are eligible.", size: 18, fontWeight: FontWeight.w700, color: Colors.white, ),
                  const SizedBox(height: 15),
                  const CustomText("Kindly allow 3-4hrs to reflect in your bank account", size: 13, fontWeight: FontWeight.w700, color: Color(0xFF3AE8CD), ),
                  const SizedBox(height: 20,),
                  ClipPath(
                    clipper: MultipleRoundedCurveClipper(),

                    child: Container(
                      height: 270,
                      width: double.infinity,
                      color:  AppColors.appPurpleColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            const SizedBox(height: 10,),
                            DottedBorder(
                              options: CustomPathDottedBorderOptions(
                                padding: const EdgeInsets.all(8),
                                color: Colors.white,
                                strokeWidth: 2,
                                dashPattern: [10, 5],
                                customPath: (size) => Path()
                                  ..moveTo(0, size.height)
                                  ..relativeLineTo(size.width, 0),
                              ),
                              child: const SizedBox(
                                width: double.infinity,
                                child: CustomText("Transaction Summary", color: Colors.white, size: 14, fontWeight: FontWeight.w700, textAlign: TextAlign.center,),
                              ),
                            ),
                            const SizedBox(height: 12,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Purpose of Loan", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                                CustomText("School Fees", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Next Repayment Date", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                                CustomText("02/04/2021", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Interest Rate", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                                CustomText("10%", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Monthly Payment", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                                CustomText("₦ 5,000", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("No of Payments", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                                CustomText("24", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Total Payback Amount", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                                CustomText("₦ 58,000", color: Colors.white,fontWeight: FontWeight.w700, size: 13,),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomCheckbox(labelText: "I agree to the Terms & Conditions and Policy", textColor: Colors.white,),
                  const SizedBox(height: 20),
                  CustomButtonTwo(
                    onPressed: () {
                      Get.to(const ApplyCompletedScreen());
                    },
                    text: "Accept",
                    buttonColor: Colors.white,
                    textColor:  AppColors.appPurpleColor,
                    height: 60,
                    borderRadius: 8,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(height: 20),
                  CustomButtonTwo(
                    onPressed: () {
                      Get.to(NavBar());
                    },
                    text: "Decline",
                    gradient:  AppColors.gradientBackground,
                    textColor: Colors.white,
                    height: 60,
                    borderRadius: 8,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
      ),
    );
  }
}
