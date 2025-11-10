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
            child: Image.asset("assets/images/BG.png", fit: BoxFit.cover),
          ),

          // Skip button
          if (_currentPage < _pages.length - 1)
            Positioned(
              top: 60,
              right: 20,
              child: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, "/LoginSingupScreen"),
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),

          // PageView
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _pages.length,
            itemBuilder: (context, index) => _buildPage(_pages[index]),
          ),

          // Indicators
          Positioned(
            bottom: 340,
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
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: _onContinue,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4334B4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          _currentPage == _pages.length - 1
                              ? "Get Started"
                              : "Continue",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
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
