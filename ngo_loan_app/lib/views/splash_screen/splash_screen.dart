import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/views/welcome_screens/first_welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => const FirstWelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackground, // Your gradient constant
        ),
        child: Stack(
          children: [
            // Top House Image
            Positioned(
              left: -125,
              top: 15,
              child: Opacity(
                opacity: 0.03,
                child: Image.asset(
                  topHouse,
                  width: 252,
                  height: 279,
                ),
              ),
            ),

            // Center Splash Image (rotated)
            Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: -25.82 * (3.14159 / 180),
                child: Image.asset(
                  splashImage,
                  width: 500,
                  height: 500,
                ),
              ),
            ),

            // Bottom House Image
            Positioned(
              left: 286,
              top: 625,
              child: Opacity(
                opacity: 0.03,
                child: Image.asset(
                  bottomHouse,
                  width: 224.83,
                  height: 220.66,
                ),
              ),
            ),

            // Text at bottom
            const Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "NGO LOAN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    height: 10.5 / 55, // line height as in your VelocityX
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
