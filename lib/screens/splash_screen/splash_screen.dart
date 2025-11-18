import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(); 
    
    _navigateToOnboarding();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
          Positioned.fill(
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.image1,
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
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAnimatedDot(delay: 0.0),
                const SizedBox(width: 6),
                _buildAnimatedDot(delay: 0.2),
                const SizedBox(width: 6),
                _buildAnimatedDot(delay: 0.4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedDot({required double delay}) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double animValue = (_animationController.value - delay) % 1.0;
        double offset = 10 * (0.5 - (0.5 * (1 - (animValue * 2 - 1).abs())));
        
        return Transform.translate(
          offset: Offset(0, -offset),
          child: child,
        );
      },
      child: Container(
        height: 10,
        width: 10,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}