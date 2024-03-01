import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_dnt/screens/auth/auth_screen.dart';

import 'home_screen.dart';
class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null) {
      Timer(
          const Duration(seconds: 1),
              () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen())));
    }
    else{
      Timer(
          const Duration(seconds: 1),
              () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AuthScreen())));
    }
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ImageIcon(
          AssetImage('assets/images/logo.png'),
          size: 200,
        )
      ),
    ) ;
  }
}
