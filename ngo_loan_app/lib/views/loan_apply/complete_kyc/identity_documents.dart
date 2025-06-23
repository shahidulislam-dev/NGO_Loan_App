import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:ngo_app/widgets_common/custom_image_container.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

import '../../../common/const/const.dart';
import '../../../common/const/styles.dart';

class IdentityDocuments extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const IdentityDocuments({
    required this.controller,
    required this.formKey,
    super.key,
  });


  @override
  State<IdentityDocuments> createState() => _IdentityDocumentsState();
}

class _IdentityDocumentsState extends State<IdentityDocuments> {
  File? nidFront;
  File? nidBack;
  File? passportFront;
  File? passportBack;
  File? passbook;
  File? passportSizeImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(String type) async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        final file = File(picked.path);
        switch (type) {
          case 'nidFront':
            nidFront = file;
            break;
          case 'nidBack':
            nidBack = file;
            break;
          case 'passportFront':
            passportFront = file;
            break;
          case 'passportBack':
            passportBack = file;
            break;
          case 'passbook':
            passbook = file;
            break;
          case 'passportPhoto':
            passportSizeImage = file;
            break;
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(boxShadow: [ AppTextStyle.commonShadow]),
                  child: Image.asset(identityDocumentImage)),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                "Upload Identity Document",
                size: 24,
                color:  AppColors.fontGrey,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                "You can upload any Identity document from the options below, However some require front and back upload. This will help us identify that this is you!",
                size: 18,
                color:  AppColors.darkGrey,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              CustomTextfield(controller: widget.controller, hintText: "Enter Your NID Number"),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: CustomImageContainer(text: "NID Front Side", icon: Image.asset(idCardIcon), onTap: () => _pickImage('nidFront'), height: 120, width: double.infinity,imageFile: nidFront,)),
                  const SizedBox(width: 10,),
                  Expanded(child: CustomImageContainer(text: "NID Back Side", icon: Image.asset(idCardBackIcon,), onTap: () => _pickImage('nidBack'), height: 120, width: double.infinity,imageFile: nidBack,)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                "Or",
                size: 24,
                color:  AppColors.darkGrey,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              CustomTextfield(controller: widget.controller, hintText: "Enter Your Passport Number"),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: CustomImageContainer(text: "Passport Front", icon: Image.asset(idCardIcon), onTap: () => _pickImage('passportFront'), height: 120, width: double.infinity, imageFile: passportFront,),),
                  const SizedBox(width: 10,),
                  Expanded(child: CustomImageContainer(text: "Passport Back", icon: Image.asset(idCardBackIcon,), onTap: () => _pickImage('passportBack'), height: 120, width: double.infinity, imageFile: passportBack,)),
                ],
              ),
              const SizedBox(height: 20,),
              CustomTextfield(controller: widget.controller, hintText: "Enter Bank Account Number"),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: CustomTextfield(controller: widget.controller, hintText: "IFSC Code")),
                  const SizedBox(width: 10,),
                  Expanded(child: CustomTextfield(controller: widget.controller, hintText: "Bank Name")),
                ],
              ),
              const SizedBox(height: 20,),
              CustomImageContainer(text: "Passbook Photo", icon: Image.asset(idCardBackIcon,), onTap: () => _pickImage('passbook'), height: 80.00, width: double.infinity, imageFile: passbook,),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                "Upload Your Passport Photo",
                size: 18,
                color:  AppColors.darkGrey,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () => _pickImage('passportPhoto'),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2.0, color:  AppColors.borderColor),
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: passportSizeImage != null
                        ? Image.file(
                      passportSizeImage!,
                      fit: BoxFit.cover,
                    )
                        : Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            passportImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Icon(
                          Icons.camera_alt,
                          color: Color.fromRGBO(0, 0, 0, 0.7),
                          size: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
