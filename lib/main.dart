import 'package:education_app/screens/HomeScreens/main_screen.dart';
import 'package:education_app/screens/exam_details/exam_details.dart';
import 'package:education_app/screens/loginscreen/login_screen.dart';
import 'package:education_app/screens/otpscreen/otp_screen.dart';
import 'package:education_app/screens/personl_details/persnol_details.dart';
import 'package:education_app/screens/registerscreen/register_screen.dart';
import 'package:education_app/screens/splash_screen/Onboarding_Screen.dart';
import 'package:education_app/screens/splash_screen/login_singup_screen.dart';
import 'package:education_app/screens/splash_screen/splash_screen.dart';
import 'package:education_app/widgets/DailyQuize/daily_quiz_page.dart';
import 'package:education_app/widgets/Leaderboard/leaderboard_page.dart';
import 'package:education_app/widgets/Notification/notification_page.dart';
import 'package:education_app/widgets/Profile/Subscription/subscription_page.dart';
import 'package:education_app/widgets/Profile/help&support/help_support.dart';
import 'package:education_app/widgets/Profile/personal_information/personal_information.dart';
import 'package:education_app/widgets/Profile/privacy_policy/privacy_policy.dart';
import 'package:education_app/widgets/Profile/profile_page.dart';
import 'package:education_app/widgets/Profile/purchage_history/purchage_history.dart';
import 'package:education_app/widgets/Profile/term_condition/term_conditions.dart';
import 'package:education_app/widgets/ProgressTrack/progresstrack_page.dart';
import 'package:education_app/widgets/ReviewQuestion/QuestionPage/Quiz_page.dart';
import 'package:education_app/widgets/ReviewQuestion/QuestionPage/view_quiz_details.dart';
import 'package:education_app/widgets/ReviewQuestion/TimeQuiz/time_quiz_page.dart';
import 'package:education_app/widgets/ReviewQuestion/TimeQuiz/time_quiz_result.dart';
import 'package:education_app/widgets/ReviewQuestion/review_question_page.dart';
import 'package:education_app/widgets/ReviewQuestion/review_question_details_page.dart';
import 'package:education_app/widgets/weak_subject/weak_subject.dart';
import 'package:education_app/widgets/weak_subject/weak_subject_list.dart';
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
      home: SplashScreen(),
      routes: {
        "/SplashScreen": (context) => SplashScreen(),
        "/OnboardinScreen": (context) => OnboardingScreen(),
        "/LoginSingupScreen": (context) => LoginSingupScreen(),
        "/LoginScreen": (context) => LoginScreen(),
        "/RegisterScreen": (context) => RegisterScreen(),
        "/OtpScreen": (context) => OtpScreen(),
        "/PersnolDetails": (context) => PersnolDetails(),
        "/ExamDetails": (context) => ExamDetails(),
        "/MainScreen": (context) => MainScreen(),
        "/QuizPageView": (context) => QuizPageView(),
        "/ViewQuizDetails": (context) => ViewQuizDetails(),
        "/ReviewQuestionPage": (context) => ReviewQuestionPage(),
        "/SecondReviewQuestionPage": (context) => SecondReviewQuestionPage(),
        "/QuizPage": (context) => QuizPage(),
        "/ProgresstrackPage": (context) => ProgresstrackPage(),
        "/LeaderboardPage": (context) => LeaderboardPage(),
        "/NotificationPage": (context) => NotificationPage(),
        "/ProfilePage": (context) => ProfilePage(),
        "/PersonalInformation": (context) => PersonalInformation(),
        "/PurchaseHistory": (context) => PurchaseHistory(),
        "/PrivacyPolicy": (context) => PrivacyPolicy(),
        "/TermConditions": (context) => TermConditions(),
        "/HelpSupport": (context) => HelpSupport(),
        "/WeakSubject": (context) => WeakSubject(),
        "/WeakSubjectList": (context) => WeakSubjectList(),
        "/TimeQuizPage": (context) => TimeQuizPage(),
        "/TimeQuizResult":(context)=>TimeQuizResult(answers: [],),
        "/SubscriptionPage":(context)=>SubscriptionPage(),
      },
    );
  }
}
