import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngo_app/common/const/const.dart';
import 'package:ngo_app/common/const/styles.dart';
import 'package:ngo_app/features/home/presentation/screen/home_screen.dart';
import 'package:ngo_app/features/navbar/presentation/nav_bar.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button_two.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/loan_histor_container.dart';
import 'package:ngo_app/widgets_common/repayment_history.dart';

class LoanHistoryScreen extends StatelessWidget {
  const LoanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: bgWidget(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const CustomText(
                  "CW20213987608",
                  size: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                const SizedBox(height: 5),
                const CustomText(
                  "₹200,000",
                  size: 38,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                const SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main content inside the container
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 190,
                          left: 25,
                          right: 25,
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Loan Status Box
                            Container(
                              height: 100,
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [AppTextStyle.strongShadow],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    "Loan Status",
                                    size: 18,
                                    color: AppColors.darkGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 5),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        "Active",
                                        size: 16,
                                        color: AppColors.darkGrey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      CustomText(
                                        "68% paid",
                                        size: 16,
                                        color: AppColors.darkGrey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: LinearProgressIndicator(
                                        value: 0.68,
                                        minHeight: 10,
                                        backgroundColor: Colors.grey[300],
                                        valueColor: const AlwaysStoppedAnimation<Color>(
                                          Color(0xFFFF4117),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),

                            // Repayment History Title
                            const CustomText(
                              "Repayment History",
                              size: 16,
                              color: AppColors.fontGrey,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(height: 5),
                            const RepaymentHistoryTile(
                              title: "August Repayment",
                              date: "10/08/2025",
                              amount: "₦65,000.00",
                            ),
                            const SizedBox(height: 5),
                            const RepaymentHistoryTile(
                              title: "July Repayment",
                              date: "10/07/2025",
                              amount: "₦65,000.00",
                            ),
                            const SizedBox(height: 5),
                            const RepaymentHistoryTile(
                              title: "June Repayment",
                              date: "10/06/2025",
                              amount: "₦65,000.00",
                            ),
                            const SizedBox(height: 5),
                            const RepaymentHistoryTile(
                              title: "May Repayment",
                              date: "10/05/2025",
                              amount: "₦65,000.00",
                            ),
                            const SizedBox(height: 5),
                            const RepaymentHistoryTile(
                              title: "April Repayment",
                              date: "10/04/2025",
                              amount: "₦65,000.00",
                            ),
                            const SizedBox(height: 15),
                            CustomButtonTwo(
                                onPressed: (){Get.to(NavBar());},
                                text: "Back to Home",
                              borderRadius: 8,
                              gradient: AppColors.gradientBackground,
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),

                      // Floating Info Card
                      Positioned(
                        top: -50,
                        left: 25,
                        right: 25,
                        child: Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [AppTextStyle.strongShadow],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20),
                            child: Column(
                              children: [
                                loanHistoryContainer(
                                  "Amount",
                                  "₹200,000.00",
                                  "Duration",
                                  "7 months",
                                ),
                                const SizedBox(height: 10),
                                loanHistoryContainer(
                                  "Monthly Repayment",
                                  "₹25,000.00",
                                  "Loan Release Date",
                                  "01/23/2021",
                                ),
                                const SizedBox(height: 10),
                                loanHistoryContainer(
                                  "Total Payable",
                                  "₹210,000.00",
                                  "Next Due Date",
                                  "08/15/2025",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
