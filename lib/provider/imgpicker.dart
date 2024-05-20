import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../modal/imgpicker.dart';
import '../utils/all_variable.dart';


class CustomImageProvider extends ChangeNotifier {
  Addimage a1 = Addimage(image: File(""));

  ImageCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    String path = xFile!.path;

    a1.image = File(path);

    allimages = a1.image.path;

    notifyListeners();
  }

  ImageGallery() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);

    String path = xFile!.path;

    a1.image = File(path);

    allimages = a1.image.path;

    notifyListeners();
  }

  ClearImage() {
    a1.image = File("");
    notifyListeners();
  }
}