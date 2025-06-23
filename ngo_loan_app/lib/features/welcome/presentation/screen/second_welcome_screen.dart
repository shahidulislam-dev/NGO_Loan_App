
import 'package:get/get.dart';
import 'package:ngo_app/app_route.dart';

import 'package:ngo_app/features/welcome/presentation/widget/welcome_screen.dart';
import 'package:ngo_app/widgets_common/floatingButton.dart';

import '../../../../common/const/const.dart';


class SecondWelcomeScreen extends StatelessWidget {
  const SecondWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
         Get.toNamed(AppRoute.welcomeThree);
        },
        child: floatingButton(),
      ),
      body: const WelcomeScreen(
        imagePath: secondWelcome,
        textOne: "helps you cover not only the",
        textTwo: "expenses towards your course fees",
      ),
    );
  }
}
