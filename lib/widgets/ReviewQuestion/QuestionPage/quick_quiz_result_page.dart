import 'package:flutter/material.dart';
import 'dart:math';

import 'package:percent_indicator/circular_percent_indicator.dart';

class QuickQuizResultPage extends StatefulWidget {
  const QuickQuizResultPage({super.key});

  @override
  State<QuickQuizResultPage> createState() => _QuickQuizResultPageState();
}

class _QuickQuizResultPageState extends State<QuickQuizResultPage> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['All (20)', 'Incorrect (19)', 'Correct(8)'];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildHeader(),
          _quizeResult(),
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
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
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

  Widget _quizeResult() {
    return Positioned(
      top: 90,
      left: 16,
      right: 16,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF4334B4).withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircularPercentIndicator(
                  radius: 70.0,
                  lineWidth: 12.0,
                  percent: 0.5, // 50% progress
                  progressColor: const Color(0xFF01B91D),
                  backgroundColor: Colors.white24,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    "50%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  arcType: ArcType.HALF,
                  arcBackgroundColor: Colors.white,
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Image.asset("assets/images/vec1.png"),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "5/10",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Answered Correctly",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Image.asset("assets/images/vec.png"),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "17s",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Quiz Time",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 8),

                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/vec.png"),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "2s",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Average Time Per Question",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(double height) {
    return Positioned(
      top: height * 0.40,
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
            const SizedBox(height: 20),
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
          _buildQuestionCard(isCorrect: false),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: true),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: false),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: true),
          const SizedBox(height: 12),
          _buildQuestionCard(isCorrect: false),
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
