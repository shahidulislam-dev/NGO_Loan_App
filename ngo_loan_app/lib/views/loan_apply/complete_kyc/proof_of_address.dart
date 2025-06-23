import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ngo_app/widgets_common/custom_dropdown.dart';
import 'package:ngo_app/widgets_common/custom_image_container.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';
import 'package:ngo_app/widgets_common/district_dropdown.dart';

import '../../../common/const/colors.dart';
import '../../../common/const/images.dart';
import '../../../common/const/styles.dart';

class ProofOfAddress extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

   const ProofOfAddress({
    required this.controller,
    required this.formKey,
    super.key,
  });

  @override
  State<ProofOfAddress> createState() => _ProofOfAddressState();
}

class _ProofOfAddressState extends State<ProofOfAddress> {
  final List<String> items = ["Bank Statement", "Utility Bill", "Electricity Bill", "Tax Receipt"];
  String? selectedValue;

  File? addressProof;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAddressProofImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        addressProof = File(picked.path);
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
                "Upload Proof Of Address",
                size: 24,
                color:  AppColors.fontGrey,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                "This will also help us identify that it is you running this account",
                size: 18,
                color:  AppColors.darkGrey,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              CustomTextfield(controller:widget.controller, hintText: "Residential Address"),
              const SizedBox(height: 20,),
              const DistrictDropdown(),
              const SizedBox(height: 20,),
              const CustomText("Select Proof of Address Document type", size: 20, color:  AppColors.fontGrey, fontWeight: FontWeight.w400,),
              const SizedBox(height: 20,),
              CustomDropdown(
                hintText: ' Select a Option',
                items: items,
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              CustomImageContainer(text: "Proof Of Address", icon: Image.asset(proofAddressImage), onTap: _pickAddressProofImage, height: 100, width: double.infinity, imageFile: addressProof,),
              const SizedBox(height: 10,),
              const CustomText("Acceptable Utility Bill / Bank Statement must be within 6 months", size: 16, color:  AppColors.darkGrey, fontWeight:FontWeight.w400,)
            ],
          ),
        )
      ),
    );
  }
}
