import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButtonTwo extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor;
  final Gradient? gradient;
  final Color textColor;
  final double height;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final double? width; // ✅ New width parameter

  const CustomButtonTwo({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonColor,
    this.gradient,
    this.textColor = Colors.white,
    this.height = 50,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.width, // ✅ Optional width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // ✅ Use passed width if provided
      height: height,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Ink(
            decoration: BoxDecoration(
              color: gradient == null ? buttonColor ?? Colors.blue : null,
              gradient: gradient,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: CustomText(
                text,
                color: textColor,
                size: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
