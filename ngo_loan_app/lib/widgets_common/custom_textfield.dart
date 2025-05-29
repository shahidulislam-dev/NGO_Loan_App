import 'package:flutter/material.dart';
import 'package:ngo_app/const/colors.dart';
class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscureCharacter;
  final String? hintText;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextfield({super.key,  required this.controller, this.keyboardType, this.isObscureText = false, this.obscureCharacter = "*", required this.hintText, this.prefixIcon, this.suffixIcon, this.enabled});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText!,
      obscuringCharacter: obscureCharacter!,
      enabled: enabled,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 10),
        constraints: BoxConstraints(
            maxHeight: height * 0.065,
            maxWidth: width
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: darkGrey, fontSize: 18) ,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
              color: borderColor,
              width: 1.5
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
              color: borderColor,
              width: 1.5
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
              color: borderColor,
              width: 1.5
          ),
        ),
      ),
    );
  }
}
