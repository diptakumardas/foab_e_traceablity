/*
import 'package:e_traceability_beta/provider/screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleWithField extends StatefulWidget {
  const TitleWithField(
      {super.key,
      required this.title1,
      required this.title2,
      required this.textFieldValue,
      this.readOnly = false});
  final String title1;
  final String title2;
  final String textFieldValue;
  final bool? readOnly;

  @override
  State<TitleWithField> createState() => _TitleWithFieldState();
}

class _TitleWithFieldState extends State<TitleWithField> {
  TextEditingController controller = TextEditingController();;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text = widget.textFieldValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title1),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              readOnly: false,

              controller: controller,
              onChanged: (value) {
                setState(() {
                  controller.text = value;
                  Provider.of<FarmingOptionsProvider>(context, listen: false)
                      .updateLandArea(value);

                });
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                isDense: true,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(widget.title2)
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/screen_provider.dart';

class TitleWithField extends StatefulWidget {
  const TitleWithField({
    Key? key,
    required this.title1,
    required this.title2,
    required this.textFieldValue,
    this.readOnly = false, this.keyBoardType,
  }) : super(key: key);

  final String title1;
  final String title2;
  final String textFieldValue;
  final bool? readOnly;
  final TextInputType? keyBoardType;

  @override
  State<TitleWithField> createState() => _TitleWithFieldState();
}

class _TitleWithFieldState extends State<TitleWithField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.textFieldValue);
  }

  @override
  void didUpdateWidget(TitleWithField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.textFieldValue != widget.textFieldValue) {
      controller.text = widget.textFieldValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title1),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              keyboardType: widget.keyBoardType,

              readOnly: widget.readOnly ?? false,
              controller: controller,
              onChanged: (value) {
                if (!widget.readOnly!) {
                  // Update the corresponding value in the provider
                  Provider.of<FarmingOptionsProvider>(context, listen: false).updateField(widget.title1, value);
                }
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                isDense: true,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(widget.title2),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
