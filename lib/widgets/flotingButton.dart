import 'package:flutter/material.dart';
import '../screen/image_upload_screen.dart';

myFlotingButton(BuildContext context){
  return FloatingActionButton.extended(
    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageUploadScreen(),)),
    label: const Text(
      "Upload",
      style: TextStyle(color: Colors.white),
    ),
    icon: const Icon(
      Icons.upload,
      color: Colors.white,
    ),
  );
}