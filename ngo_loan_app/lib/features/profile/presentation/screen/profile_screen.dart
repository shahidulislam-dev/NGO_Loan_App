
import 'package:get/get.dart';
import 'package:ngo_app/app_route.dart';
import 'package:ngo_app/features/profile/controller/profile_controller.dart';

import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../common/const/colors.dart';
import '../../../../common/const/images.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Center(
                child: Container(
                  height: 142,
                  width: 142,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.darkGrey, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: controller.userData['image'] != null && controller.userData['image'].toString().isNotEmpty
                        ? Image.network(
                      controller.userData['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          profileImage,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                        : Image.asset(
                      profileImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
               Center(
                child: Obx(()=> CustomText(
                   controller.userData["full_name"],
                    size: 20,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Full Name",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: nameController,
                hintText: controller.userData['full_name']??"Gokul Kumari",
                enabled: false,
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Registered Number",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: nameController,
                hintText: controller.userData['email']??'',
                enabled: false,
              ),
              const SizedBox(height: 10),
              const CustomText(
                "District",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: nameController,
                hintText: controller.userData['district']??"Barishal",
                enabled: false,
              ),
              const SizedBox(height: 20),
              customButton(
                onPressed: () {
                 Get.toNamed(AppRoute.editProfile);
                },
                text: "Edit Profile",
              ),
              const SizedBox(height: 20),
              customButton(
                onPressed: () {
                  controller.logoutUser();
                },
                text: "Logout",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
