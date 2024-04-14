import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/upload_screen_controller.dart';
import 'package:untitled1/utils/app_color.dart';

class ImageUploadScreen extends StatelessWidget {
  const ImageUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: double.infinity,
          child: GetBuilder<UploadScreenController>(
            init: UploadScreenController(), // Initialize the controller
            initState: (_) {
              Get
                  .find<UploadScreenController>()
                  .reactive;
            },
            builder: (myData) =>
                Column(
                  children: [
                    myData.imagePath != null
                        ? SizedBox(
                      height: 220,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          myData.imagePath!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : const Icon(
                      Icons.image, color: AppColors.secenderyColor,
                      size: 70,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50)),
                        onPressed: () {
                          myData.pickImage();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Select Image"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50)),
                        onPressed: () {
                          myData.uploadPhoto();
                          if (myData.loading) {
                            Get.defaultDialog(
                              title: '',
                              content: const CircularProgressIndicator(),
                            );
                          }
                        },
                        icon: const Icon(Icons.upload),
                        label: const Text("Upload"),
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
