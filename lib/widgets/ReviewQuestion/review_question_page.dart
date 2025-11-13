import 'package:flutter/material.dart';

class ReviewQuestionPage extends StatefulWidget {
  const ReviewQuestionPage({super.key});

  @override
  State<ReviewQuestionPage> createState() => _ReviewQuestionPageState();
}

class _ReviewQuestionPageState extends State<ReviewQuestionPage> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['All', 'Flags', 'Incorrect', 'Correct'];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildHeader(),
          _buildMainContent(height),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset("assets/images/BG.png", fit: BoxFit.cover),
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: 50,
      left: 16,
      right: 16,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 80),
          const Text(
            "Review Question",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(double height) {
    return Positioned(
      top: height * 0.15,
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            _buildTabBar(),
            _buildTabIndicator(),
            SizedBox(height: 20),
            Expanded(child: _buildQuestionsList()),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child: Text(
              tab,
              style: TextStyle(
                color: Colors.black,
                fontWeight: _selectedTabIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTabIndicator() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 20),
          child: Row(
            children: [
              Container(
                height: 4,
                width: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFF6A5AE0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xFF6A5AE0),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionsList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/SecondReviewQuestionPage");
            },
            child: _buildQuestionCard(isCorrect: false),
          ),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: false),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: false),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: false),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildQuestionCard({required bool isCorrect}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFFF8F9FD),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                    left: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subject name here",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Please select your exam as per your industry. Or you can skip it for now and add later from setting.",
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 40,
              decoration: BoxDecoration(
                color: isCorrect
                    ? const Color(0xFF01B91D).withOpacity(0.2)
                    : const Color(0xFFD70404).withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Icon(
                  isCorrect ? Icons.check : Icons.close,
                  color: isCorrect ? Colors.green : Colors.red,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
