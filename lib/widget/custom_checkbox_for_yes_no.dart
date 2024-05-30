import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YesNoCheckBox extends StatefulWidget {
  const YesNoCheckBox({super.key});

  @override
  State<YesNoCheckBox> createState() => _YesNoCheckBoxState();
}

class _YesNoCheckBoxState extends State<YesNoCheckBox> {
  bool isYesChecked = false;
  bool isNoChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          activeColor: Colors.black,
            title: Text("হ্যাঁ"),
            controlAffinity: ListTileControlAffinity.leading,
            value: isYesChecked, onChanged: (bool? value){

          setState(() {
            isYesChecked = value!;
          });
        }),
        CheckboxListTile(
          activeColor: Colors.black,
            title: Text("না"),
            controlAffinity: ListTileControlAffinity.leading,
            value: isNoChecked, onChanged: (bool? value){


          setState(() {
            isNoChecked = value!;
          });
        }),
      ],
    );
  }
}
