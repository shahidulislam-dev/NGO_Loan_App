import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:ngo_app/features/profile/controller/profile_controller.dart';
import 'package:ngo_app/views/loan_apply/education_help/exam_screen.dart';
import 'package:ngo_app/widgets_common/home_card.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../common/const/colors.dart';
import '../../../../common/const/images.dart';
import '../../../../common/const/styles.dart';
import '../../../loan_application/presentation/screen/complete_kyc_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      slideImage1,
      slideImage2,
      firstWelcome,
      thirdWelcome,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  height: 160,
                ),
                items: imgList
                    .map(
                      (item) => ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                )
                    .toList(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(  const CompleteKycScreen());
                      },
                      child: homeCard(
                        icon: loanIcon1,
                        title: "Loan Apply",
                        status: "View Status",
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){Get.to(const LoanExamScreen());},
                      child: homeCard(
                        icon: loanIcon2,
                        title: "Education Help Apply",
                        status: "View Status",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: homeCard(
                      icon: loanIcon3,
                      title: "Medical  Help Apply",
                      status: "View Status",
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: homeCard(
                      icon: loanIcon4,
                      title: "Pregnancy Help Apply ",
                      status: "View Status",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: homeCard(
                      icon: loanIcon5,
                      title: "Death Help Apply",
                      status: "View Status",
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: homeCard(
                      icon: loanIcon1,
                      title: "Other Help Apply ",
                      status: "View Status",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 29),
              // Image with shadow, replicate VelocityX box.shadow.make()
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(homeImage1),
                ),
              ),
              const SizedBox(height: 15),
              const CustomText(
                "Empowering dreams through easy and affordable loans — your trusted NGO loan app for a brighter tomorrow.",
                size: 15,
                color:  AppColors.darkGrey,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.normal,
                fontFamily: AppTextStyle.regular,
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    homeImage2,
                    height: 305,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
