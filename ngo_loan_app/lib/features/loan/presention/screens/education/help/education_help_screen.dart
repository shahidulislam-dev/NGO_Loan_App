import 'package:get/get.dart';
import 'package:ngo_app/common/const/const.dart';
import 'package:ngo_app/features/loan/presention/screens/education/help/exam_score_eligibility.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_radio.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

class EducationHelpScreen extends StatefulWidget {
  final int score;
  final int total;
  const EducationHelpScreen({super.key, required this.score, required this.total});

  @override
  State<EducationHelpScreen> createState() => _EducationHelpScreenState();
}

class _EducationHelpScreenState extends State<EducationHelpScreen> {
  TextEditingController controller = TextEditingController();
  String existingLoan = "No";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          "Apply For Loan",
          size: 17,
          fontWeight: FontWeight.w700,
          color:  AppColors.darkGrey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const CustomText(
                      "How much do you want to borrow?",
                      size: 16,
                      color:  AppColors.darkGrey,
                    ),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: controller,
                      hintText: "30,000",
                      prefixIcon: const Icon(Icons.currency_pound),
                    ),
                    const SizedBox(height: 5),
                    const CustomText(
                      "You have a minimum of N30,000",
                      color: Color(0xFFF56C2A),
                      size: 12,
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      "Why are you want loan?",
                      size: 16,
                      color:  AppColors.darkGrey,
                    ),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      controller: controller,
                      hintText: "Because of my form fill up",

                    ),
                    const SizedBox(height: 5),
                    const CustomText(
                      "You have a maximum of 24 months",
                      color: Color(0xFFF56C2A),
                      size: 12,
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      "Have you any running loan?",
                      size: 16,
                      color:  AppColors.darkGrey,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          customRadio("Yes", existingLoan, (val) {
                            setState(() => existingLoan = val);
                          }),
                          const SizedBox(width: 20),
                          customRadio("No", existingLoan, (val) {
                            setState(() => existingLoan = val);
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            customButton(
              onPressed: () {
                if (controller.text.trim().isEmpty || controller.text.trim().isEmpty){
                  Get.snackbar("Error","Field is required",backgroundColor: AppColors.red);
                  return;
                }
                Get.to(() => ExamScoreEligibility(score: widget.score, total: widget.total));
              },
              text: "Apply",
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
