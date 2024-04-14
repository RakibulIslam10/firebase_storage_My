import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/binding_controller.dart';
import 'package:untitled1/utils/app_color.dart';
import 'package:untitled1/utils/conts.dart';
import 'screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingController(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.secenderyColor),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          centerTitle: true,
          backgroundColor: AppColors.secenderyColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        scaffoldBackgroundColor: AppColors.primaryColor,
      ),
      title: AllStrings.appName,
      home: const SplashScreen(),
    );
  }
}
