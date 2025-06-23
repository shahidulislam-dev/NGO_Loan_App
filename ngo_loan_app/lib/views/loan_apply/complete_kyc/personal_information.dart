import 'package:flutter/gestures.dart';

import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:ngo_app/widgets_common/custom_dropdown.dart';

import '../../../common/const/const.dart'; // Make sure this import points to your CustomDropdown widget

class PersonalInformation extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final List<String> items = ["Male", "Female"];

  PersonalInformation({
    required this.controller,
    required this.formKey,
    super.key,
  });

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  String? selectedValue;
  TextEditingController dobController = TextEditingController();
  @override
  void initState() {
    super.initState();
    dobController = TextEditingController();
  }

  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Image.asset(completeProfileImage),
            const SizedBox(height: 20),
            const CustomText(
              "Complete Your KYC",
              fontWeight: FontWeight.bold,
              size: 24,
              color:  AppColors.darkGrey,
            ),
            const SizedBox(height: 10),
            const CustomText(
              "For the purpose of industry regulation, your details are required.",
              fontWeight: FontWeight.w400,
              color:  AppColors.darkGrey,
              textAlign: TextAlign.center,
              size: 18,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: widget.controller,
                        hintText: "First Name"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: widget.controller,
                        hintText: "Last Name"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomDropdown(
                      hintText: ' Select a Gender',
                      items: widget.items,
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: dobController,
                        hintText: "DOB",
                      suffixIcon: const Icon(Icons.calendar_month_outlined),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2025),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                          setState(() {
                            dobController.text = formattedDate;
                          });
                        }
                      },
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: widget.controller,
                        hintText: "Father/Husband Name"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: widget.controller,
                        hintText: "Surname"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: widget.controller,
                hintText: "Father/Husband Occupation"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: widget.controller,
                hintText: "Email Address"
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: widget.controller,
                        hintText: "Phone Number"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: widget.controller,
                        hintText: "Alternate Phone Number"
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CustomTextfield(
                        controller: widget.controller,
                        hintText: "Guardian Name"
                    )
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextfield(
                        controller: widget.controller,
                        hintText: "Guardian Phone Number",
                      keyboardType: TextInputType.number,
                    )
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: widget.controller,
                hintText: "Relation With Guardian"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: widget.controller,
                hintText: "Occupation"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: widget.controller,
                hintText: "Monthly Income"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: widget.controller,
                hintText: "Number of family member"
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                controller: widget.controller,
                hintText: "Who are in the family ?"
            ),
            const SizedBox(height: 20),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color:  AppColors.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(text: 'By continuing, you are acknowledging that you have read, understood and agreed to the KYC\'s '),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: const TextStyle(color:  AppColors.darkBlue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(color:  AppColors.darkBlue, fontWeight: FontWeight.bold),
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