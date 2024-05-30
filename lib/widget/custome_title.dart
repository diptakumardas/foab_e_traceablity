import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.06,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFE0FFD6),
      child: Center(child: Text(title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
    );
  }
}

