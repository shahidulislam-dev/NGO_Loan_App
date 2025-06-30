import 'package:get/get.dart';
import 'package:ngo_app/common/const/const.dart';
import 'package:ngo_app/features/loan/presention/screens/widgets/loan_text_field.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_radio.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

class MedicalHelpApply extends StatefulWidget {
  const MedicalHelpApply({super.key});

  @override
  State<MedicalHelpApply> createState() => _MedicalHelpApplyState();
}

class _MedicalHelpApplyState extends State<MedicalHelpApply> {

  TextEditingController controller = TextEditingController();
  String selectedOption = "No";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const CustomText("Medical Help Apply",
          size: 16,
          color: AppColors.darkGrey,),
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
                    LoanTextField(
                        controller: controller,
                        hintText: "30,000",
                      prefixIcon: const Icon(Icons.currency_pound),
                      title: "How much do you want to borrow",
                      instructions: "You have a minimum of N30,000",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    LoanTextField(
                      controller: controller,
                      hintText: "Because of my surgery!",
                      title: "Why are you want loan?",
                      instructions: "You have a maximum of 24 months",
                      keyboardType: TextInputType.text,
                    ),


                    const SizedBox(height: 20),
                    const CustomText(
                      "Have you any running loan?",
                      size: 16,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          customRadio("Yes", selectedOption, (val) {
                            setState(() => selectedOption = val);
                          }),
                          const SizedBox(width: 20),
                          customRadio("No", selectedOption, (val) {
                            setState(() => selectedOption = val);
                          }),
                        ],
                      ),),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            customButton(
              onPressed: ()  {
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
