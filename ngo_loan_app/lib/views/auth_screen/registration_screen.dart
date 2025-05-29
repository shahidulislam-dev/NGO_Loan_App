import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/views/auth_screen/login_screen.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_checkbox.dart';
import 'package:ngo_app/widgets_common/custom_dropdown.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';


import 'package:ngo_app/widgets_common/custom_text.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  bool? isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bgWidget(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 12, right: 12),
          child: Stack(children: [
            Column(
              children: [
                const Center(
                  child: CustomText(
                    loan,
                    size: 58,
                    fontFamily: bold,
                    fontWeight: FontWeight.w900,
                    color: white,
                  ),
                ),
                const SizedBox(height: 40),
                const CustomText(
                  register,
                  size: 24,
                  fontFamily: regular,
                  fontWeight: FontWeight.w600,
                  color: white,
                ),
                const SizedBox(height: 20),
                const CustomText(
                  registerMsg,
                  size: 18,
                  color: white,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CustomTextfield(
                  controller: nameController,
                  hintText: nameHint,
                  prefixIcon: const Icon(Icons.person, color: iconColor, size: 40),
                ),
                const SizedBox(height: 20),
                CustomTextfield(
                  controller: nameController,
                  keyboardType: TextInputType.number,
                  hintText: mobileHint,
                  prefixIcon: const Icon(Icons.phone_in_talk, color: iconColor, size: 40),
                ),
                const SizedBox(height: 20),
                const CustomDropdowns(),
                const SizedBox(height: 17),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          gender,
                          color: white,
                          fontFamily: regular,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: gradientBackground,
                          border: Border.all(color: white, width: 2),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const CustomText(
                        female,
                        color: white,
                        fontFamily: semibold,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const CustomCheckbox(),
              ],
            ),
            Positioned(
              bottom: 40,
              left: 5,
              right: 5,
              child: customButton(
                onPressed: () {
                  Get.to(const LoginScreen());
                },
                text: "Continue",
              ),
            )
          ]),
        ),
      ),
    );
  }
}
