import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 200,left: 16,right: 16),
          child: Container(
            height: MediaQuery.sizeOf(context).height*.5,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white30,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                    child: Image.asset("images/chingri.webp",fit: BoxFit.cover,),
                  ),

                ),
                SizedBox(
                  height: 50,
                ),
                Text("বৈশিস্ট্য ১",style: TextStyle(
                    fontSize: 22
                ),
                ),
                Text("স্বাদুপানির চিংড়ি চাষ স্বাদু পানিতে এখনো ব্যাপকভাবে চিংড়ি চাষ শুরু হয়। \n দেশে স্বাদু পানিতে চাষ উপযোগী চিংড়ি হচ্ছে গলদা চিংড়ি")
              ],
            ),
          ),
        )
    );
  }
}
