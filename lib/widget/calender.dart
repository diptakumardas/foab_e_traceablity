import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const Calender({Key? key, required this.title, required this.hintText, required this.controller}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 50,
          child: TextField(
            readOnly: true,
            onTap: _selectDate,
            controller: widget.controller,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                hintText: widget.hintText,
                filled: true,
                fillColor: Colors.transparent,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        initialDate: DateTime.now());
    if (picked != null) {
      setState(() {
        widget.controller.text = picked.toString().split(" ")[0];
      });
    }
  }
}
