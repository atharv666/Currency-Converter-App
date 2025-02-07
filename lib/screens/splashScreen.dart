import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:currency_convertor/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: LottieBuilder.asset("assets/Lottie/Main Scene.json", fit: BoxFit.contain, height: 70,),
          ),
          Expanded(
            child: LottieBuilder.asset("assets/Lottie/Main Scene1.json", fit: BoxFit.contain,),
          ),
        ],
      ), 
      backgroundColor: Colors.blueAccent,
      splashIconSize: 400,
      nextScreen: const Home()
    );
  }
}