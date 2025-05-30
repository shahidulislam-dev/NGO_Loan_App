import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/widgets_common/custom_checkbox.dart';
import 'package:ngo_app/widgets_common/custom_dropdown.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

class AddressDetails extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const AddressDetails({
    required this.controller,
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Image.asset(completeProfileImage),
            const SizedBox(height: 20),
            const CustomText(
              "Complete Your Address Details",
              fontWeight: FontWeight.bold,
              size: 24,
              color: darkGrey,
            ),
            const SizedBox(height: 10),
            const CustomText(
              "For the purpose of industry regulation, your address details are required.",
              fontWeight: FontWeight.w400,
              color: darkGrey,
              textAlign: TextAlign.center,
              size: 18,
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                "Present Address",
                fontWeight: FontWeight.w800,
                color: darkGrey,
                textAlign: TextAlign.start,
                size: 20,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextfield(
                controller: controller,
                hintText: "House/Road No or Village"
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller,
                        hintText: "Thana"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller,
                        hintText: "Post Office"
                    )
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller,
                        hintText: "Post Code"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller,
                        hintText: "District"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                "Permanent Address",
                fontWeight: FontWeight.w800,
                color: darkGrey,
                textAlign: TextAlign.start,
                size: 20,
              ),
            ),
            const SizedBox(height: 10,),

             const CustomCheckbox(labelText: "Same As Present Address?", textColor: darkGrey,),

            const SizedBox(height: 20),
            CustomTextfield(
                controller: controller,
                hintText: "House/Road No or Village"
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller,
                        hintText: "Thana"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller,
                        hintText: "Post Office"
                    )
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: controller,
                        hintText: "Post Code"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: controller,
                        hintText: "District"
                    )
                ),
              ],
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color: darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(text: 'By continuing, you are acknowledging that you have read, understood and agreed to the KYC\'s '),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: const TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
