import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network/network_manager.dart';
import '../network/requestModel/login_request.dart';
import '../widget/custome_button.dart';
import '../widget/test_widget.dart';
import 'dash_board.dart';

class LoginScreenTest extends StatefulWidget {
  const LoginScreenTest({super.key});

  @override
  State<LoginScreenTest> createState() => _LoginScreenTestState();
}

class _LoginScreenTestState extends State<LoginScreenTest> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void login(String username, password, context) {
    NetworkManager()
        .logIn(LoginRequest(email: username, password: password))
        .then((value) {
      if (value.encoded != null &&
          value.encoded!.isError != null &&
          value.encoded!.isError!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value.encoded!.error?.errMsg ?? 'An error occurred'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login complete!'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${error.toString().split(':').last}'),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 92, left: 16, right: 16),
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
              "স্বাগতম, দয়া করে লগইন করুন",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .15,
            ),
            Form(
              key: formKey,
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      CustomeTextField(
                        title: 'খামারির আইডি',
                        hintText: "আপনার আইডি লিখুন",
                        obscureText: false,
                        onChanged: (text) {
                          userController.text = text;
                        },
                        errorMessage: "Email can't be empty",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomeTextField(
                        suffixIcons: CupertinoIcons.eye_slash_fill,
                        title: "পাসওয়ার্ড",
                        hintText: "পাসওয়ার্ড",
                        obscureText: true,
                        onChanged: (text) {
                          passwordController.text = text;
                        },
                        errorMessage: "Password can't be empty",
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .05,
                      ),
                      CustomeButton(
                          title: "প্রবেশ করুন ",
                          onClicked: () {
                            if (formKey.currentState!.validate()) {
                              login(userController.text,
                                  passwordController.text, context);
                            }

                            /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));*/
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                          child: Text(
                              "নিবন্ধন করার জন্য অফিসার এর সাথে \n             যোগাযোগ করুন "))
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ]))));
  }
}
