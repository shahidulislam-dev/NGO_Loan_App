import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/views/auth_screen/otp_screen.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();
    DateTime? lastBackPressTime;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          DateTime now = DateTime.now();
          if (lastBackPressTime == null ||
              now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
            lastBackPressTime = now;

            Fluttertoast.showToast(
              msg: "Press back again to exit",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
            );
          } else {
            SystemNavigator.pop(); // Exit the app
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: bgWidget(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 12, right: 12),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    loan,
                    style: TextStyle(
                      fontSize: 58,
                      fontFamily: bold,
                      fontWeight: FontWeight.w900,
                      height: 10.5 / 58,
                      color: white,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          signInto,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: regular,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          signInWithMobil,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: white,
                          ),
                        ),
                        const SizedBox(height: 70),
                        CustomTextfield(
                          controller: mobileController,
                          keyboardType: TextInputType.number,
                          hintText: mobileHint,
                          prefixIcon:
                          const Icon(Icons.phone_in_talk, color: iconColor, size: 40),
                        ),
                        const SizedBox(height: 40),
                        customButton(
                          onPressed: () {
                            Get.to(const OtpScreen());
                          },
                          text: "Login",
                        ),
                      ],
                    ),
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
