import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/const/colors.dart';

import 'dart:io';


class CustomImageContainer extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final File? imageFile; // <-- Add this

  const CustomImageContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.height,
    this.width,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: const RoundedRectDottedBorderOptions(
          dashPattern: [8, 4],
          strokeWidth: 2,
          radius: Radius.circular(12),
          color: borderColor,
          padding: EdgeInsets.all(16),
        ),
        child: SizedBox(
        height: height,
        width: width,
        child: imageFile != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: height,
            width: width,
            child: Image.file(
              imageFile!,
              fit: BoxFit.cover,
            ),
          ),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            if (icon != null) icon!,
          ],
        ),
      ),

      ),
    );
  }
}

