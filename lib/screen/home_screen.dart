import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/home_screen_controller.dart';
import 'package:untitled1/utils/conts.dart';
import 'package:untitled1/widgets/flotingButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: myFlotingButton(context),
      appBar: AppBar(
        title: const Text(
          AllStrings.appName,
        ),
      ),
      body: GetBuilder<HomeScreenController>(
        builder: (controller) => controller.imageList.isEmpty
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  itemCount: controller.imageList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) => Card(
                    child: GridTile(
                      child: Image.network(
                        controller.imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
