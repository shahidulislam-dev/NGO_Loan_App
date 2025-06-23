// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';

import '../../controller/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key}) {
    Get.put(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackground,
        ),
        child: Stack(
          children: [
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
                    height: 10.5 / 55,
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
