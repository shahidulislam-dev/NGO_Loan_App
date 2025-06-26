
import 'package:get/get.dart';
import 'package:ngo_app/features/edit/profile/edit_profile_controller.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_radio.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/district_dropdown.dart';

import '../../../common/const/const.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  final controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomText(
                  "Edit Profile",
                  size: 20,
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Obx(() {
                  return GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      height: 142,
                      width: 142,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.darkGrey, width: 2),
                        image: DecorationImage(
                          image: controller.selectedImage.value != null
                              ? FileImage(controller.selectedImage.value!)
                              : const AssetImage(profileImage) as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Full Name",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: controller.nameController,
                hintText: "Gokul Kumari",
                enabled: true,
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Registered Number",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: controller.phoneController,
                hintText: "01765782562",
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Alternate Number",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: controller.altPhoneController,
                hintText: "01765782562",
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Email",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: controller.emailController,
                hintText: "shahidul@gmail.com",
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Date Of Birth",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.dobController,
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
                      controller.dobController.text = formattedDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "Eg: 22/01/2001",
                  suffixIcon: const Icon(Icons.calendar_month),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Address",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: controller.addressController,
                hintText: "Monipur, Mirpur",
              ),
              const SizedBox(height: 10),
              const CustomText(
                "Education Qualification",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                controller: controller.educationController,
                hintText: "Masters of Science",
              ),
              const SizedBox(height: 10),
              const CustomText(
                "District",
                size: 15,
                color: AppColors.darkGrey,
              ),
              const SizedBox(height: 10),
               DistrictDropdown(),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    "Sex : ",
                    size: 16,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w600, // semibold
                  ),
                  const SizedBox(width: 30),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: AppColors.gradientBackground,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CustomText(
                    female,
                    size: 16,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => Row(
                children: [
                  const CustomText("Status : ", size: 16),
                  customRadio("Married", controller.maritalStatus.value, (val) {
                    controller.maritalStatus.value = val;
                  }),
                  customRadio("Unmarried", controller.maritalStatus.value, (val) {
                    controller.maritalStatus.value = val;
                  }),
                ],
              )),

              const SizedBox(height: 30),
              customButton(onPressed: () {}, text: "Save Changes"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
