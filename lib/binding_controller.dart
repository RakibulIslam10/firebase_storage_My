import 'package:get/get.dart';
import 'package:untitled1/controller/home_screen_controller.dart';
import 'package:untitled1/controller/splash_screen_controller.dart';
import 'controller/upload_screen_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => UploadScreenController());
    Get.lazyPut(() => HomeScreenController());
  }

}