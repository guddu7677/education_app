import 'package:education_app/screens/HomeScreens/main_screen.dart';
import 'package:education_app/screens/exam_details/exam_details.dart';
import 'package:education_app/screens/loginscreen/login_screen.dart';
import 'package:education_app/screens/otpscreen/otp_screen.dart';
import 'package:education_app/screens/personl_details/persnol_details.dart';
import 'package:education_app/screens/registerscreen/register_screen.dart';
import 'package:education_app/screens/splash_screen/Onboarding_Screen.dart';
import 'package:education_app/screens/splash_screen/login_singup_screen.dart';
import 'package:education_app/screens/splash_screen/splash_screen.dart';
// import 'package:education_app/widgets/DailyQuize/daily_quiz_page.dart';
import 'package:education_app/widgets/DailyQuize/second_quiz_page.dart';
import 'package:education_app/widgets/DailyQuize/third_quiz_page.dart';
import 'package:education_app/widgets/Leaderboard/leaderboard_page.dart';
import 'package:education_app/widgets/Notification/notification_page.dart';
import 'package:education_app/widgets/Profile/personal_information/personal_information.dart';
import 'package:education_app/widgets/Profile/privacy_policy/privacy_policy.dart';
import 'package:education_app/widgets/Profile/profile_page.dart';
import 'package:education_app/widgets/Profile/purchage_history/purchage_history.dart';
import 'package:education_app/widgets/Profile/term_condition/term_conditions.dart';
import 'package:education_app/widgets/ProgressTrack/progresstrack_page.dart';
import 'package:education_app/widgets/ReviewQuestion/QuestionPage/question_page1.dart';
import 'package:education_app/widgets/ReviewQuestion/QuestionPage/question_page2.dart';
import 'package:education_app/widgets/ReviewQuestion/QuestionPage/quick_quiz_result_page.dart';
import 'package:education_app/widgets/ReviewQuestion/QuestionPage/view_quiz_details.dart';
import 'package:education_app/widgets/ReviewQuestion/review_question_page.dart';
import 'package:education_app/widgets/ReviewQuestion/review_question_details_page.dart';
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
      home: ProfilePage(),
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
        //  "/DailyQuizePage":(context)=>DailyQuizePage(),
         "/SecondQuizPage":(context)=>SecondQuizPage(),
         "/ThirdQuizPage":(context)=>ThirdQuizPage(),
         "/ViewQuizDetails":(context)=>ViewQuizDetails(),
         "/ReviewQuestionPage":(context)=>ReviewQuestionPage(),
         "/SecondReviewQuestionPage":(context)=>SecondReviewQuestionPage(),
         "/QuestionPage1":(context)=>QuestionPage1(),
         "/QuestionPage2":(context)=>QuestionPage2(),
         "/QuickQuizResultPage":(context)=>QuickQuizResultPage(),
          "/ProgresstrackPage":(context)=>ProgresstrackPage(),
          "/LeaderboardPage":(context)=>LeaderboardPage(),
          "/NotificationPage":(context)=>NotificationPage(),
          "/ProfilePage":(context)=>ProfilePage(),
          "/PersonalInformation":(context)=>PersonalInformation(),
          "/PurchaseHistory":(context)=>PurchaseHistory(),
          "/PrivacyPolicy":(context)=>PrivacyPolicy(),
          "/TermConditions":(context)=>TermConditions(),
      },
    );
  }
}
