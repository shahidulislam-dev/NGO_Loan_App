import 'dart:async';
import 'dart:developer';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ngo_app/features/navbar/presentation/nav_bar.dart';


import 'package:ngo_app/widgets_common/custom_button.dart';

// Import your CustomText widget here
import 'package:ngo_app/widgets_common/custom_text.dart';

import '../../common/const/const.dart';
import '../../common/const/styles.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int start = 59;

  void startTimer() {
    const onSec = Duration(seconds: 1);
    Timer.periodic(onSec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 143.69,
                  width: 200,
                  margin: const EdgeInsets.only(top: 189),
                  child: Image.asset(mobileIcon),
                ),
                const SizedBox(height: 20),
                const CustomText(
                  verifyMobile,
                  fontFamily: AppTextStyle.semibold,
                  fontWeight: FontWeight.w600,
                  size: 20,
                  color: Colors.black, // Or white if you want white text
                ),
                const SizedBox(height: 30),
                const CustomText(
                  verifyMsg,
                  color:  AppColors.fontsLight,
                  fontFamily: AppTextStyle.regular,
                  fontWeight: FontWeight.w400,
                  size: 15,
                ),
                const SizedBox(height: 8),
                const CustomText(
                  sampleNumber,
                  fontFamily: AppTextStyle.bold,
                  fontWeight: FontWeight.w400,
                  size: 15,
                ),
                const SizedBox(height: 30),
                const CustomText(
                  enterOtpReq,
                  fontFamily: AppTextStyle.bold,
                  fontWeight: FontWeight.w400,
                  size: 15,
                ),
                const SizedBox(height: 20),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  fillColor:  AppColors.white,
                  filled: true,
                  numberOfFields: 6,
                  borderColor:  AppColors.borderColor,
                  showFieldAsBox: true,
                  onCodeChanged: (code) {
                    log(code);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      "Resend OTP",
                      fontFamily: AppTextStyle.bold,
                      fontWeight: FontWeight.w400,
                      size: 15,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 60),
                    GestureDetector(
                      onTap: () {
                        startTimer();
                      },
                      child: CustomText(
                        "00:$start",
                        color:  AppColors.red,
                        fontFamily: AppTextStyle.bold,
                        fontWeight: FontWeight.w400,
                        size: 15,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const CustomText(
                      "Sec",
                      fontFamily: AppTextStyle.bold,
                      fontWeight: FontWeight.w400,
                      size: 15,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              left: 8,
              right: 8,
              child: customButton(
                onPressed: () {
                  Get.to(NavBar());
                },
                text: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
