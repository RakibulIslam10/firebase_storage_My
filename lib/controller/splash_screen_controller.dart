import 'package:get/get.dart';
import 'package:untitled1/screen/home_screen.dart';

class SplashScreenController extends GetxController {
  SplashScreenController() {splashLoadingInit();}



  static Future<void> splashLoadingInit() async {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAll(const HomeScreen()),
    );
  }
}
