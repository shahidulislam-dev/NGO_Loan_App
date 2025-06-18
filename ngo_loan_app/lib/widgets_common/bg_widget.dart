import 'package:ngo_app/const/const.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    constraints: const BoxConstraints.expand(), // Forces full screen size
    decoration: const BoxDecoration(
      gradient: gradientBackground,
    ),
    child: child,
  );
}
