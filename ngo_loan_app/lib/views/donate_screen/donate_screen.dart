import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    return Scaffold(
        body: bgWidget(
          child:   SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText("Donate", size: 58, color: Colors.white, fontWeight: FontWeight.w900, ),
                  const SizedBox(height: 40,),
                  Image.asset(donateImage, height: 100,),
                  const SizedBox(height: 40,),
                  CustomTextfield(controller: amountController, hintText: "Enter Amount", prefixIcon: const Icon(Icons.currency_pound, color: iconColor, size: 30,),),
                  const SizedBox(height: 18,),
                  CustomTextfield(controller: amountController, hintText: "Mobile Number", prefixIcon: const Icon(Icons.phone_in_talk, color: iconColor, size: 30,),),
                  const SizedBox(height: 18,),
                  CustomTextfield(controller: amountController, hintText: "Enter Bank Account Number"),
                  const SizedBox(height: 18,),
                  Row(
                    children: [
                      Expanded(child: CustomTextfield(controller: amountController, hintText: "IFSC Code")),
                      const SizedBox(width: 10,),
                      Expanded(child: CustomTextfield(controller: amountController, hintText: "Bank Name")),
                    ],
                  ),
                  const SizedBox(height: 45,),
                  customButton(onPressed: (){}, text: "Continue")
                ],
              ),
            ),
          )
        )
    );
  }
}
