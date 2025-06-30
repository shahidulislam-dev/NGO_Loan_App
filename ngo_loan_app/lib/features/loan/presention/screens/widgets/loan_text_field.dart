import 'package:ngo_app/common/const/const.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

class LoanTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? title;
  final String? instructions;
  final Widget? prefixIcon;
  final VoidCallback? onTap;

  const LoanTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    required this.hintText,
    this.title,
    this.instructions,
    this.prefixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         CustomText(
          title!,
          size: 16,
          color: AppColors.darkGrey,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onTap: onTap,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 10),
            constraints: BoxConstraints(
              maxHeight: height * 0.065,
              maxWidth: width,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.darkGrey, fontSize: 18),
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppColors.borderColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppColors.borderColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppColors.borderColor, width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 5),
        CustomText(
         instructions!,
          color: const Color(0xFFF56C2A),
          size: 12,
        ),
      ],
    );
  }
}
