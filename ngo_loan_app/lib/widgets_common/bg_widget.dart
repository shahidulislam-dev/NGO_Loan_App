import 'package:ngo_app/const/const.dart';

Widget bgWidget({Widget? child}) {
  return Container(
      decoration: const BoxDecoration(
        gradient: gradientBackground, // Your gradient constant
      ),
      child: child);
}
