
import 'package:ngo_app/features/donate/controller/donation_controller.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/const/colors.dart';
import '../../../../common/const/images.dart';

class DonateScreen extends StatelessWidget {
   DonateScreen({super.key});
   final DonationController controller = Get.find<DonationController>();


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
                    CustomTextfield(controller: controller.amountController, hintText: "Enter Amount", prefixIcon: const Icon(Icons.currency_pound, color:  AppColors.iconColor, size: 30,),),
                    const SizedBox(height: 18,),
                    CustomTextfield(controller: controller.mobileController, hintText: "Mobile Number", prefixIcon: const Icon(Icons.phone_in_talk, color:  AppColors.iconColor, size: 30,),),
                    const SizedBox(height: 18,),
                    CustomTextfield(controller: controller.accountNumberController, hintText: "Enter Bank Account Number"),
                    const SizedBox(height: 18,),
                    Row(
                      children: [
                        Expanded(child: CustomTextfield(controller: controller.codeController, hintText: "IFSC Code")),
                        const SizedBox(width: 10,),
                        Expanded(child: CustomTextfield(controller: controller.bankNameController, hintText: "Bank Name")),
                      ],
                    ),
                    const SizedBox(height: 45,),
                    customButton(onPressed: (){
                      controller.createDonation();
                    }, text: "Continue")
                  ],
                ),
              ),
            )
        )
    );
  }
}
