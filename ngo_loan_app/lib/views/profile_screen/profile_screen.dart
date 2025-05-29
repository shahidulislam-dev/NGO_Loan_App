
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/views/auth_screen/login_screen.dart';
import 'package:ngo_app/views/profile_screen/edit_profile_screen.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    border: Border.all(color: darkGrey, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, -3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage(profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: CustomText(
                  "Gokul Kumari",
                  size: 20,
                  color: darkGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Full Name",
                size: 15,
                color: darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: nameController,
                hintText: "Gokul Kumari",
                enabled: false,
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Registered Number",
                size: 15,
                color: darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: nameController,
                hintText: "01765782562",
                enabled: false,
              ),
              const SizedBox(height: 10),
              const CustomText(
                "District",
                size: 15,
                color: darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: nameController,
                hintText: "Barishal",
                enabled: false,
              ),
              const SizedBox(height: 20),
              customButton(
                onPressed: () {
                  Get.to(const EditProfileScreen());
                },
                text: "Edit Profile",
              ),
              const SizedBox(height: 20),
              customButton(
                onPressed: () {
                  Get.to(const LoginScreen());
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
