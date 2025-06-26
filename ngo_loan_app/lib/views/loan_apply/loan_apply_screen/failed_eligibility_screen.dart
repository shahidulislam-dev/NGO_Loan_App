import 'package:get/get.dart';
import 'package:ngo_app/features/navbar/presentation/nav_bar.dart';


import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button_two.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

import '../../../common/const/const.dart';

class FailedEligibilityScreen extends StatelessWidget {
  const FailedEligibilityScreen({super.key});

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
              const SizedBox(height: 40),
              Expanded(
                child: SingleChildScrollView(
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
                                failedIcon,
                                height: 300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 150),
                      const CustomText(
                        "Sorry ! You are not eligible.",
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      const CustomText(
                        "Please try another loan or help loan",
                        size: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 100),
                      CustomButtonTwo(
                        onPressed: () {
                          Get.to(NavBar());
                        },
                        buttonColor: Colors.white,
                        text: "Back To Home",
                        textColor:  AppColors.appPurpleColor,
                        borderRadius: 8,
                        height: 70,
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
