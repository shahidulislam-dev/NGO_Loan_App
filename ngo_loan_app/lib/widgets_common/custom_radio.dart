

import '../common/const/const.dart';
import '../common/const/styles.dart';

Widget customRadio(String label, String groupValue, void Function(String) onChanged) {
  bool isSelected = label == groupValue;

  return GestureDetector(
    onTap: () => onChanged(label),
    child: Row(
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isSelected ? AppColors.gradientBackground : null,
            color: isSelected ? null : Colors.white,
            border: Border.all(color: Colors.black, width: 2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.darkGrey,
            fontFamily: AppTextStyle.semibold,
          ),
        ),
        const SizedBox(width: 20),
      ],
    ),
  );
}
