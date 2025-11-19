import 'package:education_app/CustomButton/bottomNavButton.dart';
import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class LoginSingupScreen extends StatefulWidget {
  const LoginSingupScreen({super.key});

  @override
  State<LoginSingupScreen> createState() => _LoginSingupScreenState();
}

class _LoginSingupScreenState extends State<LoginSingupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),

          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.3),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    AppImages.lock,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          /// Bottom White Card
          Positioned(
            bottom: 60,
            left: 16,
            right: 16,
            child: Container(
              height: 330,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Login Or Sign Up",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.boldblblack22,
                  ),

                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),

                  /// Create Account Button
                  AppButton(
                    title: "Create An Account!",
                    onTap: () => Navigator.pushNamed(context, "/RegisterScreen"),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("OR", style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),

                  /// Login Button (Secondary style)
                  AppButton(
                    title: "Login",
                    color: AppColors.primary.withOpacity(0.2),
                    textColor: AppColors.primary,
                    onTap: () => Navigator.pushNamed(context, "/LoginScreen"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
