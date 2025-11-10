import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; // ✅ Make sure this path is correct

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  /// Wait 3 seconds then navigate
  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background image
          Positioned.fill(
            child: Image.asset(
              "assets/images/BG.png",
              fit: BoxFit.cover,
            ),
          ),

          /// Center logo + loader
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/image1.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 24),
                const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ],
            ),
          ),

          /// Bottom dots
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(),
                const SizedBox(width: 6),
                _buildDot(),
                const SizedBox(width: 6),
                _buildDot(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Small white dot
  Widget _buildDot() {
    return Container(
      height: 10,
      width: 10,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
