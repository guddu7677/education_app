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
                    AppImages.bookimage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 16,
            right: 16,
            child: Container(
              height: 330,
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
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login Or Sign Up",
                      textAlign: TextAlign.center,
                      style:AppTextStyles.boldblblack22,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/RegisterScreen");
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4334B4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Create An Account!",
                            style:AppTextStyles.boldWhite16,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 1, width: 100, color: Colors.grey),
                        Text(
                          "OR",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Container(height: 1, width: 100, color: Colors.grey),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/LoginScreen");
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4334B4).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: AppTextStyles.primaryBold16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
