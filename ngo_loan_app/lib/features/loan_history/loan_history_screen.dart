import 'package:firebase_auth/firebase_auth.dart';
import 'package:ngo_app/common/const/const.dart';
import 'package:ngo_app/common/const/styles.dart';
import 'package:ngo_app/features/loan_application/controller/apply_loan_controller.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:get/get.dart';




class LoanHistoryScreen extends StatelessWidget {
  LoanHistoryScreen({super.key});
  final LoanController controller = Get.find<LoanController>();

  @override
  Widget build(BuildContext context) {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    Future.microtask(() => controller.fetchUserApplications(uid!));

    return Scaffold(
      body: bgWidget(
        child: Obx(() {
          final apps = controller.userApplications;

          if (apps.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          double totalAmount = apps.fold(0.0, (sum, app) {
            return sum + double.tryParse(app["amount"].toString())!;
          });

          String latestReason = apps.first["reason"] ?? "No reason";

          return Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CustomText(
                    latestReason,
                    size: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    "₹${totalAmount.toStringAsFixed(2)}",
                    size: 38,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 60),

                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
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
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 190,
                            left: 25,
                            right: 25,
                            bottom: 20,
                          ),
                          child: Column(
                            children: [
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
                                    const SizedBox(height: 10),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          "${apps.first['status']}",
                                          size: 16,
                                          color: AppColors.darkGrey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        const CustomText(
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
                                          valueColor:  AlwaysStoppedAnimation<Color>(
                                          apps.first['status']=="Active"? Colors.green:Colors.red,
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

                        // Top floating card
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
                                      "₹${apps.first["amount"] ?? "0"}",
                                      "Duration",
                                      "7 months"),
                                  const SizedBox(height: 10),
                                  loanHistoryContainer("Monthly Repayment", "₹25,000.00",
                                      "Loan Release Date", "01/23/2021"),
                                  const SizedBox(height: 10),
                                  loanHistoryContainer("Total Payable", "₹210,000.00",
                                      "Next Due Date", "08/15/2025"),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Repayment History section
                        Positioned(
                          bottom: 20,
                          left: 25,
                          right: 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                "Repayment History",
                                size: 16,
                                color: AppColors.fontGrey,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 10),
                              ...apps.map((app) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 6),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(app["reason"] ?? "No Reason"),
                                      Text("₹${app["amount"] ?? "0"}"),
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  // 🧩 Reusable row layout
  Widget loanHistoryContainer(
      String title1, String value1, String title2, String value2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _infoColumn(title1, value1),
        _infoColumn(title2, value2),
      ],
    );
  }

  Widget _infoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title,
          size: 14,
          color: AppColors.darkGrey,
        ),
        const SizedBox(height: 5),
        CustomText(
          value,
          size: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.green,
        ),
      ],
    );
  }
}

