import 'package:education_app/CustomButton/bottomNavButton.dart';
import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      image: "assets/images/books.png",
      title: "What is Lorem Ipsum?",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    OnboardingData(
      image: "assets/images/image2.png",
      title: "Why do we use it?",
      description:
          "It has survived not only five centuries, but also the leap into electronic typesetting.",
    ),
    OnboardingData(
      image: "assets/images/image3.png",
      title: "Where does it come from?",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text.",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed("/LoginSingupScreen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),
          if (_currentPage < _pages.length - 1)
            Positioned(
              top: 60,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/LoginSingupScreen");
                },
                child: const Text(
                  "Skip",
                  style: AppTextStyles.semiboldWhite16,
                ),
              ),
            ),
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _pages.length,
            itemBuilder: (context, index) => _buildPage(_pages[index]),
          ),
          Positioned(
            bottom: 310,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => _buildIndicator(index == _currentPage),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingData data) {
    return Column(
      children: [
        const SizedBox(height: 140),
        Container(
          height: 280,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(data.image, fit: BoxFit.contain),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 60),
          child: Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    data.title,
                    textAlign: TextAlign.center,
                    style:AppTextStyles.boldblblack22,
                  ),
                  Text(
                    data.description,
                    textAlign: TextAlign.center,
                    style:AppTextStyles.smibold16black2121
                  ),
                 AppButton(
  title: _currentPage == _pages.length - 1
      ? "Get Started"
      : "Continue",
  onTap: _onContinue,
  color: const Color(0xFF4334B4),
  textColor: Colors.white,

  width: double.infinity,
),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: isActive ? 20 : 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isActive ? Border.all(color: Colors.white, width: 2) : null,
        color: isActive ? Colors.transparent : Colors.white,
      ),
      child: isActive
          ? Center(
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}
