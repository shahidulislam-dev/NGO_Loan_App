import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/views/loan_history/loan_history_screen.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

class ApplyCompletedScreen extends StatelessWidget {
  const ApplyCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
                width: 100,
                child: Image.asset(completedIcon, fit: BoxFit.cover,)
            ),
            const SizedBox(height: 20),
            const CustomText("Completed!", size: 20, fontWeight: FontWeight.w800, color: darkGrey,),
            const SizedBox(height: 20),
            const CustomText("You have successfully applied for a loan. A response will be sent \nshortly.", size: 20, fontWeight: FontWeight.w600, color: darkGrey, textAlign: TextAlign.center,),
            const SizedBox(height: 40),
            customButton(onPressed: (){Get.to(const LoanHistoryScreen());}, text: "Go To Loan History")
            
          ],
        ),
      ),
    );
  }
}
