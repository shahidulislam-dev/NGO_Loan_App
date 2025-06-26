import 'package:get/get.dart';
import 'package:ngo_app/features/navbar/presentation/nav_bar.dart';

import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button_two.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/score_circle.dart';

import '../../../common/const/const.dart';

class FailedEligibilityLowScore extends StatelessWidget {
  final int score;
  final int total;
  const FailedEligibilityLowScore({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgWidget(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
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

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ScoreCircle(
                        score: score,
                        total: total,
                        progressColor:  AppColors.green,
                        backgroundColor: Colors.white,
                        size: 150,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 50),
                      const CustomText(
                        "Oops! Your Score is very low.",
                        size: 18,
                        fontWeight: FontWeight.w700,
                        color:  AppColors.red,
                      ),
                      const SizedBox(height: 20),
                      const CustomText(
                        "Sorry ! You are not eligible.",
                        size: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      const CustomText(
                        "PLease try another loan or help loan",
                        size: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 70),
                      CustomButtonTwo(
                        onPressed: () {Get.to(NavBar());},
                        text: "Back To Home",
                        textColor:  AppColors.appPurpleColor,
                        buttonColor: Colors.white,
                        height: 60,
                        borderRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
