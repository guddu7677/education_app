import 'package:education_app/CustomButton/bottomNavButton.dart';
import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/widgets/ReviewQuestion/TimeQuiz/time_quiz_page.dart';
import 'package:flutter/material.dart';

class TimeQuizResult extends StatefulWidget {
  final List<QuizAnswer> answers;

  const TimeQuizResult({super.key, required this.answers});

  @override
  State<TimeQuizResult> createState() => _TimeQuizResultState();
}

class _TimeQuizResultState extends State<TimeQuizResult> {
  int _selectedTabIndex = 0;
  late List<String> _tabs;
  late int correctCount;
  late int incorrectCount;
  late int totalQuestions;
  late double percentage;

  @override
  void initState() {
    super.initState();
    totalQuestions = widget.answers.length;
    correctCount = widget.answers.where((a) => a.isCorrect).length;
    incorrectCount = totalQuestions - correctCount;
    percentage = correctCount / totalQuestions;

    _tabs = [
      'All ($totalQuestions)',
      'Incorrect ($incorrectCount)',
      'Correct ($correctCount)',
    ];
  }

  List<QuizAnswer> get filteredAnswers {
    if (_selectedTabIndex == 1) {
      return widget.answers.where((a) => !a.isCorrect).toList();
    } else if (_selectedTabIndex == 2) {
      return widget.answers.where((a) => a.isCorrect).toList();
    }
    return widget.answers;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildHeader(),
          _quizResult(),
          _buildMainContent(height),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
         child: AppButton(
  title: "Back to Home",
  onTap: () => Navigator.pushNamed(context, "/MainScreen"),

  color: AppColors.backgroundDark,
),

        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(AppImages.background, fit: BoxFit.cover),
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
        Expanded(
          child: Center(
            child: Text(
              "Time Quiz Result",
              style: AppTextStyles.boldWhite16,
            ),
          ),
        ),

        const SizedBox(width: 20),
      ],
    ),
  );
}


  Widget _quizResult() {
    return Positioned(
      top: 90,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF4334B4).withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(
                    value: percentage,
                    strokeWidth: 6,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                  ),
                ),
                Text(
                  "${(percentage * 100).toInt()}%",
                  style: AppTextStyles.White20bold,
                ),
              ],
            ),
           SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "$correctCount/$totalQuestions",
                        style:AppTextStyles.smallWhite12bold,
                      ),
                      const SizedBox(width: 3),
                      const Flexible(
                        child: Text(
                          "Answered Correctly",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.access_time,
                          color: Color(0xFF4334B4),
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "17s",
                        style: AppTextStyles.smallWhite12bold,
                      ),
                      const SizedBox(width: 3),
                      const Flexible(
                        child: Text(
                          "Quiz Time",
                          style: AppTextStyles.smallWhite12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.timer,
                    color: Color(0xFF4334B4),
                    size: 16,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  "2s",
                  style: AppTextStyles.smallWhite12bold,
                ),
                const SizedBox(width: 3),
                const Flexible(
                  child: Text(
                    "Average Time Per Question",
                    style: AppTextStyles.smallWhite12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
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
    double tabWidth = MediaQuery.of(context).size.width / 3;
    double indicatorPosition = _selectedTabIndex * tabWidth;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xFF6A5AE0).withOpacity(0.2),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: indicatorPosition + 16,
          child: Container(
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
        ),
      ],
    );
  }

  Widget _buildQuestionsList() {
    final displayAnswers = filteredAnswers;

    if (displayAnswers.isEmpty) {
      return const Center(
        child: Text(
          "No questions in this category",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ...displayAnswers.map(
            (answer) => Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: _buildQuestionCard(answer),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(QuizAnswer answer) {
    final question = QuickQuiz[answer.questionIndex];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question["subject"] ?? "Subject",
                      style:AppTextStyles.boldblblack14,
                    ),
                    SizedBox(height: 4),
                    Text(
                      question["title"] ?? "Question",
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
                color: answer.isCorrect
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
                  answer.isCorrect ? Icons.check : Icons.close,
                  color: answer.isCorrect ? Colors.green : Colors.red,
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
