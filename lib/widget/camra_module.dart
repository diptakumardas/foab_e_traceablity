import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamraModule extends StatefulWidget {
  final Function(Uint8List) onImagePicked;

  const CamraModule({Key? key, required this.onImagePicked}) : super(key: key);

  @override
  State<CamraModule> createState() => _CamraModuleState();
}

class _CamraModuleState extends State<CamraModule> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImageFromGallery,
          child: Container(
            height: 200,
            width: double.infinity,
            color: Color(0xFFE0FFD6),
            child: _image != null
                ? Image.memory(_image!, fit: BoxFit.contain)
                : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                    Icons.image_outlined,
                    color: Colors.grey,
                    size: 40,
                ),
                const Text(
                  "ছবি নির্বাচন করুন",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: _pickImageFromCamera,
          child: Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xFFE0FFD6),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 18,
                  color: Colors.green,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60.0),
                  child: Text(
                    "ক্যামেরা খুলুন এবং ছবি তুলুন",
                    style: TextStyle(fontSize: 15, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      widget.onImagePicked(_image!);
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      widget.onImagePicked(_image!);
    });
  }
}
