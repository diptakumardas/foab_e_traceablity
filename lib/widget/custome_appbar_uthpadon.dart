import 'package:flutter/material.dart';

class CustomeAppbarUth extends StatefulWidget implements PreferredSizeWidget {
  const CustomeAppbarUth({super.key, required this.title});
  final String title;

  @override
  State<CustomeAppbarUth> createState() => _CustomeAppbarUthState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomeAppbarUthState extends State<CustomeAppbarUth> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(widget.title),
      leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
    );
  }
}
