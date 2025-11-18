import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/widgets/ReviewQuestion/QuestionPage/Quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizResultPage extends StatefulWidget {
  final List<int?> userAnswers;
  final Duration quizDuration;

  const QuizResultPage({
    super.key,
    required this.userAnswers,
    required this.quizDuration,
  });

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  int _selectedTabIndex = 0;
  late List<String> _tabs;
  late int correctCount;
  late int incorrectCount;

  @override
  void initState() {
    super.initState();
    correctCount = 0;
    incorrectCount = 0;

    for (int i = 0; i < widget.userAnswers.length; i++) {
      if (widget.userAnswers[i] == quizData[i].correctAnswerIndex) {
        correctCount++;
      } else {
        incorrectCount++;
      }
    }

    _tabs = [
      'All (10)',
      'Incorrect ($incorrectCount)',
      'Correct ($correctCount)',
    ];
  }

  List<int> _getFilteredQuestions() {
    if (_selectedTabIndex == 0) {
      return List.generate(10, (i) => i);
    } else if (_selectedTabIndex == 1) {
      return List.generate(10, (i) => i)
          .where((i) =>
              widget.userAnswers[i] != quizData[i].correctAnswerIndex)
          .toList();
    } else {
      return List.generate(10, (i) => i)
          .where((i) =>
              widget.userAnswers[i] == quizData[i].correctAnswerIndex)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final percentage = (correctCount / 10 * 100).toInt();
    final avgTimePerQuestion = widget.quizDuration.inSeconds ~/ 10;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildHeader(),
          _buildQuizResult(percentage, avgTimePerQuestion),
          _buildMainContent(height),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4334B4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Back to Home",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4334B4), Color(0xFF6A5AE0)],
          ),
        ),
      ),
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
          const Spacer(),
          const Text(
            "Review Questions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

Widget _buildQuizResult(int percentage, int avgTime) {
  return Positioned(
    top: 90,
    left: 16,
    right: 16,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF4334B4).withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          // Circular Percentage Indicator
          CircularPercentIndicator(
            radius: 60.0, // 👈 Circle Size
            lineWidth: 10.0,
            animation: true,
            percent: percentage / 100, // 👈 Convert to decimal (e.g., 80 -> 0.8)
            center: Text(
              "$percentage%",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.green,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.green, // 👈 Filled area color
            backgroundColor: Colors.white.withOpacity(0.2), // 👈 Unfilled area
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                Icons.check_circle_outline,
                "$correctCount/${widget.userAnswers.length}",
                "Answered Correctly",
              ),
              _buildStatItem(
                Icons.timer_outlined,
                "${widget.quizDuration.inSeconds}s",
                "Quiz Time",
              ),
            ],
          ),
          const SizedBox(height: 16),

          _buildStatItem(
            Icons.av_timer,
            "${avgTime}s",
            "Average Time Per Question",
          ),
        ],
      ),
    ),
  );
}


  Widget _buildStatItem(IconData icon, String value, String label) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF4334B4), size: 20),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: AppTextStyles.White14bold,
            ),
            Text(
              label,
              style: AppTextStyles.smallWhite12,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainContent(double height) {
    return Positioned(
      top: height * 0.50,
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
      padding: EdgeInsets.all(20.0),
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 4,
                width: MediaQuery.of(context).size.width / 3.5,
                margin: EdgeInsets.only(
                  left: _selectedTabIndex * (MediaQuery.of(context).size.width / 3.2),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF6A5AE0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    topRight: Radius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionsList() {
    final filteredIndices = _getFilteredQuestions();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: filteredIndices.map((index) {
          final isCorrect = widget.userAnswers[index] ==
              quizData[index].correctAnswerIndex;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildQuestionCard(index, isCorrect),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildQuestionCard(int index, bool isCorrect) {
    final question = quizData[index];

    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FD),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4334B4).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Q${index + 1}",
                          style: const TextStyle(
                            color: Color(0xFF4334B4),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        question.subject,
                        style: AppTextStyles.boldblblack14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    question.question,
                    style: AppTextStyles.subtile14black2121,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 50,
            decoration: BoxDecoration(
              color: isCorrect
                  ? const Color(0xFF01B91D).withOpacity(0.2)
                  : const Color(0xFFD70404).withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(color: Colors.grey.shade300),
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
    );
  }
}