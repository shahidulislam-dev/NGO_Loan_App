
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/views/welcome_screens/third_welcome_screen.dart';
import 'package:ngo_app/widgets_common/floatingButton.dart';
import 'package:ngo_app/widgets_common/welcome_screen.dart';

class SecondWelcomeScreen extends StatelessWidget {
  const SecondWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(const ThirdWelcomeScreen());
        },
        child: floatingButton(),
      ),
      body: welcomeScreen(
        imagePath: secondWelcome,
        text1: "helps you cover not only the",
        text2: "expenses towards your course fees",
      ),
    );
  }
}
