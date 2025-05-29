import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const PersonalInformation({
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
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(labelText: 'Full Name'),
          validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
        ),
      ),
    );
  }
}
