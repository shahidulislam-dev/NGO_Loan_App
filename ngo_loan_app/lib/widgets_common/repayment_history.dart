import 'package:ngo_app/common/const/const.dart';
import 'package:ngo_app/widgets_common/custom_text.dart';

class RepaymentHistoryTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  const RepaymentHistoryTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.darkBlue,
                width: 3,
              ),
            ),
            child: const Icon(Icons.check, size: 16, color: AppColors.darkBlue),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title,
                  size: 18,
                  color: AppColors.fontGrey,
                ),
                CustomText(
                  date,
                  size: 16,
                  color: AppColors.fontGrey,
                ),
              ],
            ),
          ),
          CustomText(
            amount,
            size: 18,
            color: AppColors.fontGrey,
          ),
        ],
      ),
    );
  }
}
