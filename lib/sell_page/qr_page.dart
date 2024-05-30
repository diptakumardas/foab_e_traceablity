
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:typed_data';

import '../view_screen/dash_board.dart';

class QrPage extends StatelessWidget {
  final Uint8List? imageData;
  final Map<String, String> formValues;

  QrPage({Key? key, required this.imageData, required this.formValues})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String qrData =
        formValues.entries.map((e) => '${e.key}: ${e.value}').join('\n');

    return Scaffold(
      appBar: AppBar(
        title: Text('Generated QR Code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                const SizedBox(height: 20),
                //if (imageData != null) Image.memory(imageData!),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.green.shade600,
                        fixedSize:
                            Size.fromWidth(MediaQuery.sizeOf(context).width),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "QR প্রিন্ট করুন",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.local_print_shop_outlined,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    )),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
                }, child: Text("এড়িয়ে যান",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
