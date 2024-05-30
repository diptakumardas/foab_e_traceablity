import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageProviderModel with ChangeNotifier {
  Uint8List? _image;
  File? _selectedImage;

  Uint8List? get image => _image;

  void setImage(File image) {
    _selectedImage = image;
    _image = image.readAsBytesSync();
    notifyListeners();
  }
}
