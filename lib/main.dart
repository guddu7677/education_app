import 'package:education_app/screens/HomeScreens/main_screen.dart';
import 'package:education_app/screens/exam_details/exam_details.dart';
import 'package:education_app/screens/loginscreen/login_screen.dart';
import 'package:education_app/screens/otpscreen/otp_screen.dart';
import 'package:education_app/screens/personl_details/persnol_details.dart';
import 'package:education_app/screens/registerscreen/register_screen.dart';
import 'package:education_app/screens/splash_screen/Onboarding_Screen.dart';
import 'package:education_app/screens/splash_screen/login_singup_screen.dart';
import 'package:education_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(
      ),
      routes: {
        "/SplashScreen":(context)=>SplashScreen(),
        "/OnboardinScreen":(context)=>OnboardingScreen(),
        "/LoginSingupScreen":(context)=>LoginSingupScreen(),
        "/LoginScreen":(context)=>LoginScreen(),
        "/RegisterScreen":(context)=>RegisterScreen(),
        "/OtpScreen":(context)=>OtpScreen(),
        "/PersnolDetails":(context)=>PersnolDetails(),
        "/ExamDetails":(context)=>ExamDetails(),
        "/MainScreen":(context)=>MainScreen(),
      },
    );
  }
}
