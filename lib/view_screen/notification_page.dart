import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/custome_appbar_uthpadon.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppbarUth(title: "বিজ্ঞপ্তি"),
      body: Center(
        child: Text("নোটিফিকেশন নেই"),
      )
    );
  }
}
