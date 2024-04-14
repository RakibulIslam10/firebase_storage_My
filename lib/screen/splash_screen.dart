import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/controller/splash_screen_controller.dart';
import 'package:untitled1/utils/conts.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SplashScreenController>(builder: (getData) =>  const Text(
      AllStrings.appName,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),),
            Lottie.asset("assets/splashLoading.json"),
          ],
        ),
      ),
    );
  }
}
