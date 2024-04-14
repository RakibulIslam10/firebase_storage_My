import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  HomeScreenController() {
    fetchImage();
  }

  List imageList = [];

  fetchImage() async {
    imageList.clear();
    final storageRef = FirebaseStorage.instance.ref().child("emon/");
    final listResult = await storageRef.listAll();
    for (var item in listResult.items) {
      String url = await item.getDownloadURL();
      imageList.add(url);
    }
    update();
  }

}
