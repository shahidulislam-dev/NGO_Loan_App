
import 'package:ngo_app/widgets_common/custom_text.dart';

import '../common/const/const.dart';

Widget loanHistoryContainer(String label1, String value1, String label2, String value2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(label1, size: 14, fontWeight: FontWeight.w300, color: AppColors.darkGrey),
            const SizedBox(height: 5),
            CustomText(value1, size: 18, fontWeight: FontWeight.w700, color: AppColors.darkGrey),
          ],
        ),
      ),
const SizedBox(width: 30,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(label2, size: 14, fontWeight: FontWeight.w300, color: AppColors.darkGrey),
            const SizedBox(height: 5),
            CustomText(value2, size: 18, fontWeight: FontWeight.w700, color: AppColors.darkGrey),
          ],
        ),
      ),
    ],
  );
}