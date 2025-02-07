// import 'package:currency_convertor/screens/home.dart';
import 'package:currency_convertor/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.pink,
      ),
      // home: Scaffold(
      //   body: Center(
      //     child: Text("Hello", style: TextStyle(fontSize: 40),),
      //     child: Text("Hello", style: TextStyle(fontFamily: 'DMSans', fontSize: 40),),
      //   ),
      // ),
      home: SplashScreen(),
    );
  }
}