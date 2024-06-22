import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html;

class ImagePickerService extends ChangeNotifier {
  List<Uint8List> images = [];
  final ImagePicker imagePicker = ImagePicker();

  void addImage(Uint8List image) {
    if (images.length < 6) {
      images.add(image);
      notifyListeners();
    }
  }

  void removeImage(Uint8List image) {
    images.remove(image);
    notifyListeners();
  }

  void clearImages() {
    images.clear();
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    if (images.length < 6) {
      final pickedFile =
          await imagePicker.pickImage(source: source, imageQuality: 20);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        images.add(bytes);
        notifyListeners();
      }
    }
  }
}
