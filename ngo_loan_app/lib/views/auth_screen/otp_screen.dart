import 'dart:async';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/views/home/home.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';

// Import your CustomText widget here
import 'package:ngo_app/widgets_common/custom_text.dart';

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
      backgroundColor: white,
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
                  fontFamily: semibold,
                  fontWeight: FontWeight.w600,
                  size: 20,
                  color: Colors.black, // Or white if you want white text
                ),
                const SizedBox(height: 30),
                const CustomText(
                  verifyMsg,
                  color: fontsLight,
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  size: 15,
                ),
                const SizedBox(height: 8),
                const CustomText(
                  sampleNumber,
                  fontFamily: bold,
                  fontWeight: FontWeight.w400,
                  size: 15,
                ),
                const SizedBox(height: 30),
                const CustomText(
                  enterOtpReq,
                  fontFamily: bold,
                  fontWeight: FontWeight.w400,
                  size: 15,
                ),
                const SizedBox(height: 20),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  fillColor: white,
                  filled: true,
                  numberOfFields: 6,
                  borderColor: borderColor,
                  showFieldAsBox: true,
                  onCodeChanged: (code) {
                    print(code);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      "Resend OTP",
                      fontFamily: bold,
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
                        color: red,
                        fontFamily: bold,
                        fontWeight: FontWeight.w400,
                        size: 15,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const CustomText(
                      "Sec",
                      fontFamily: bold,
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
                  Get.to(const Home());
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
