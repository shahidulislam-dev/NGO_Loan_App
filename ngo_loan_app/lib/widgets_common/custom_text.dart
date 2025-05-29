import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLines;

  const CustomText(
      this.text, {
        super.key,
        this.color,
        this.size,
        this.fontWeight,
        this.fontFamily,
        this.textAlign,
        this.height,
        this.overflow,
        this.maxLines,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily,
        height: height,
      ),
    );
  }
}
