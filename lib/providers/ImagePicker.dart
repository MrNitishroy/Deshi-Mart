import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html;

class ImagePickerService extends ChangeNotifier {
  List<String> images = [];
  final ImagePicker imagePicker = ImagePicker();

  void addImage(String image) {
    if (images.length < 6) {
      images.add(image);
      notifyListeners();
    }
  }

  void removeImage(String image) {
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
        // Convert the file to a data URL
        final bytes = await pickedFile.readAsBytes();
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        images.add(url);
        notifyListeners();
      }
    }
  }
}
