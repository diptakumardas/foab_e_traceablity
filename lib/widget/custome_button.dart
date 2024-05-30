import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatefulWidget {
   CustomeButton({super.key, required this.title,required this.onClicked});
  String title;
  Function onClicked;


  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          widget.onClicked.call();

        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.green.shade600,
            fixedSize: Size.fromWidth(
                MediaQuery.sizeOf(context).width)),
        child:  Text(
          widget.title,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
