
import 'package:get/get.dart';
import 'package:ngo_app/app_route.dart';

import 'package:ngo_app/features/welcome/presentation/widget/welcome_screen.dart';

import 'package:ngo_app/widgets_common/floatingButton.dart';

import '../../../../common/const/const.dart';


class FirstWelcomeScreen extends StatelessWidget {
  const FirstWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.welcomeTwo);
        },
        child: floatingButton(), // Assuming this returns a widget
      ),
      body: const WelcomeScreen(
        imagePath: firstWelcome,
        textOne: "Keep Smiling and meet your",
        textTwo: "needs with quick Loans",
      ),
    );
  }
}
