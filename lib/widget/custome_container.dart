import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomeContainer extends StatefulWidget {
  CustomeContainer({
    super.key,
    required this.title,required this.onClicked,required this.imagePath
  });
  String title;
  Function onClicked;
  String imagePath;

  @override
  State<CustomeContainer> createState() => _CustomeContainerState();
}

class _CustomeContainerState extends State<CustomeContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onClicked.call();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .14,
        width: MediaQuery.of(context).size.width * .4,
        decoration: BoxDecoration(
          color: const Color(0xFFE0FFD6),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: SvgPicture.asset(
                widget.imagePath,
                semanticsLabel: "Vector Image",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .012,
            ),
             Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
