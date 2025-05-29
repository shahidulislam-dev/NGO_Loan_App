import 'package:flutter/material.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

class IdentityDocuments extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const IdentityDocuments({
    required this.controller,
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [commonShadow]
                ),
                  child: Image.asset(identityDocumentImage)
              ),
              const SizedBox(height: 20,),
              const CustomText("Upload Identity Document", size: 24, color: fontGrey, fontWeight: FontWeight.w600,),
              const SizedBox(height: 10,),
              const CustomText("You can upload any Identity document from the options below, However some require front and back upload. This will help us identify that this is you!", size: 18, color: darkGrey, fontWeight: FontWeight.w400, textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
