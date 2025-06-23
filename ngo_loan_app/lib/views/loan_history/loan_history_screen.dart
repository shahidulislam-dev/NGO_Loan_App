
import 'package:flutter/material.dart';
import 'package:ngo_app/common/const/styles.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/loan_histor_container.dart';

class LoanHistoryScreen extends StatelessWidget {
  const LoanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgWidget(
        child: Padding(
            padding:const EdgeInsets.only(top: 12),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CustomText("CW20213987608", size: 16, fontWeight: FontWeight.w300, color: Colors.white,),
                const CustomText("₹200,000", size: 38, fontWeight: FontWeight.w800, color: Colors.white,),
                const SizedBox(height: 70,),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: const Offset(0, -50), // Move up by 50
                          child: Container(
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow:  const [AppTextStyle.strongShadow],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                              child: Column(
                                children: [
                                  loanHistoryContainer("Amount", "₹200,000.00", "Duration", "7 months"),
                                  const SizedBox(height: 10),
                                  loanHistoryContainer("Monthly Repayment", "₹25,000.00", "Loan Release Date", "01/23/2021"),
                                  const SizedBox(height: 10),
                                  loanHistoryContainer("Amount", "₹200,000.00", "Duration", "7 months"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // other children if needed
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
