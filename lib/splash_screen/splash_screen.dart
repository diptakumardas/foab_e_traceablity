
import 'package:flutter/material.dart';
import 'package:foab_e_traceablity/splash_screen/page_1.dart';
import 'package:foab_e_traceablity/splash_screen/page_2.dart';
import 'package:foab_e_traceablity/splash_screen/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../view_screen/login_screen.dart';
import '../view_screen/test_login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [Page1(), Page2(), Page3()],
        ),
        Container(
            alignment: const Alignment(0, .8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ////skip
                GestureDetector(
                  child: const Text("এড়িয়ে যান "),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreenTest()));
                  },
                ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(activeDotColor: Colors.black,dotHeight: 7,dotWidth: 7),
                ),

                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreenTest()));
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green),
                          child: Center(child: const Text("শুরু করুন",style: TextStyle(
                            fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold
                          ),)),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {_controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);

                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),




                        ),
                      )
              ],
            ))
      ],
    ));
  }
}
