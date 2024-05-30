import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'qr_page.dart';
import '../widget/calender.dart';
import '../widget/camra_module.dart';
import '../widget/customeForm.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  Uint8List? _image;
  File? selectedImage;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers to avoid memory leaks
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomeAppbarUth(title: "বিক্রয় করুন"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CamraModule(
                onImagePicked: (image) {
                  setState(() {
                    _image = image;
                  });
                },
              ),
              const SizedBox(height: 30),
              Customeform(
                title: "মাছের নাম ",
                hintText: "মাছের নাম লিখুন",
                controller: controller1,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Customeform(
                title: "পরিমাণ",
                hintText: "পরিমাণ লিখুন",
                controller: controller3,
              ),
              const SizedBox(height: 10),
              Customeform(
                title: "দাম",
                hintText: "দাম লিখুন",
                controller: controller4,
              ),
              const SizedBox(height: 10),
              Calender(
                title: "তারিখ",
                hintText: "তারিখ নির্বাচন করুন",
                controller: controller5,
              ),
              const SizedBox(height: 40),
              CustomeButton(

                title: "QR তৈরি করুন",
                onClicked: () {
                  if(controller1.text.isEmpty ||
                      controller3.text.isEmpty ||
                      controller4.text.isEmpty ||
                      controller5.text.isEmpty ||
                      _image == null){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Warning"),
                          content: Text("All fields must be filled and an image must be selected."),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrPage(
                          imageData: _image,
                          formValues: {
                            "মাছের  নাম": controller1.text,
                            "পরিমাণ": controller3.text,
                            "দাম": controller4.text,
                            "তারিখ": controller5.text,
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
