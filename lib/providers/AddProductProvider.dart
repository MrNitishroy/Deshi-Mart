import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductProvider extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  void pickImage() async {
    var reponse = await picker.pickImage(source: ImageSource.gallery);
    if (reponse != null) {
      print(reponse.path);
    }
  }
}
