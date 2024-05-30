import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/custome_button.dart';
import 'dash_board.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .3,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: [
                      Text(
                        "সাইন ইন করুন ",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "ওহে! আপনাকে  স্বাগতম , আপনি মিস করা হয়েছে ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * .7,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "খামারির আইডি",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        height: 55,
                        child: Form(
                          child: TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                              hintText: "আপনার নাম লিখুন ",
                              fillColor: Colors.white30,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "পাসওয়ার্ড ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 55,
                        child: Form(
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "পাসওয়ার্ড",
                              fillColor: Colors.white30,
                              filled: true,
                              suffixIcon: const Icon(
                                Icons.remove_red_eye_outlined,
                                size: 30,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      CustomeButton(title: "প্রবেশ করুন ", onClicked: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));
                      }),

                      const SizedBox(
                        height: 30,
                      ),

                      const Center(child: Text("নিবন্ধন করার জন্য অফিসার এর সাথে \n             যোগাযোগ করুন "))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
