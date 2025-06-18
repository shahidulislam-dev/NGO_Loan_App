import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/views/home/home.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button_two.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/score_circle.dart';

class FailedEligibilityLowScore extends StatelessWidget {
  const FailedEligibilityLowScore({super.key});

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
                        color: darkGrey,
                        width: 2,
                      ),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: darkGrey,
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
                      const ScoreCircle(
                        score: 20,
                        total: 30,
                        progressColor: green,
                        backgroundColor: Colors.white,
                        size: 150,
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 70),
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
                        onPressed: () {Get.to(const Home());},
                        text: "Back To Home",
                        textColor: appPurpleColor,
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
