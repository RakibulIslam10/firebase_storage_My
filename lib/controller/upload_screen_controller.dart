import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/controller/home_screen_controller.dart';
import 'package:untitled1/screen/home_screen.dart';

class UploadScreenController extends GetxController {
  File? imagePath;
  double progressup = 0.0;
  bool loading = false;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = File(file.path);
      update();
    }
  }

  Future uploadPhoto() async {
    if (imagePath != null) {
      Get.defaultDialog(
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          title: '',
          content: const CircularProgressIndicator());
      final file = File(imagePath!.path);
      final metadata = SettableMetadata(contentType: "image/jpeg");
      final storageRef = FirebaseStorage.instance.ref();
      final uploadTask = storageRef
          .child("emon/${DateTime.now().millisecondsSinceEpoch.toString()}")
          .putFile(file, metadata);
      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            progressup = progress;
            update();
            break;
          case TaskState.paused:
            print("Upload is paused.");
            break;
          case TaskState.canceled:
            print("Upload was canceled");
            break;
          case TaskState.error:
            break;
          case TaskState.success:
            Get.back();
            Get.defaultDialog(
                title: 'Upload result',
                content: const Text("Upload Successfully"),
                actions: [
                  GetBuilder<HomeScreenController>(
                    builder: (controller) => TextButton(
                        onPressed: () {
                          controller.fetchImage();
                          Get.offAll(const HomeScreen());
                        },
                        child: GetBuilder<HomeScreenController>(
                          builder: (controller) => const Text("Ok"),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel")),
                ]);

            break;
        }
      });
      loading = false;
      update();
    } else {
      Get.defaultDialog(content: const Text("Please Select a Photo"), actions: [
        TextButton(onPressed: () => Get.back(), child: const Text("Ok")),
        TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
      ]);
    }
  }
}
