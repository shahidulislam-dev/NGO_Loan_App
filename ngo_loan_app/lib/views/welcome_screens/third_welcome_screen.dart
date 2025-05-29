
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/views/auth_screen/registration_screen.dart';
import 'package:ngo_app/widgets_common/floatingButton.dart';
import 'package:ngo_app/widgets_common/welcome_screen.dart';

class ThirdWelcomeScreen extends StatelessWidget {
  const ThirdWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(const RegistrationScreen());
        },
        child: floatingButton(), // Make sure this widget is also VelocityX-free
      ),
      body: welcomeScreen(
        imagePath: thirdWelcome,
        text1: "No stress with payments",
        text2: "and loan process",
      ),
    );
  }
}
