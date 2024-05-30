
import 'package:flutter/material.dart';
import 'package:foab_e_traceablity/provider/image_provider.dart';
import 'package:foab_e_traceablity/provider/screen_provider.dart';
import 'package:foab_e_traceablity/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>FarmingOptionsProvider()),
      ChangeNotifierProvider(create: (context)=>ImageProviderModel())

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );




    /*ChangeNotifierProvider(
      create: (context) => FarmingOptionsProvider(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SellScreen()
      ),
    );*/
  }
}
