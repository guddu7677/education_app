import 'package:education_app/widgets/ReviewQuestion/TimeQuiz/time_quiz_first_page.dart';
import 'package:education_app/widgets/ReviewQuestion/TimeQuiz/time_quiz_result.dart';
import 'package:flutter/material.dart';

class TimeQuizReviewPage extends StatefulWidget {
  final List<QuizAnswer> answers;

  const TimeQuizReviewPage({
    super.key,
    required this.answers,
  });

  @override
  State<TimeQuizReviewPage> createState() => _TimeQuizReviewPageState();
}

class _TimeQuizReviewPageState extends State<TimeQuizReviewPage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  QuizAnswer get _currentAnswer => widget.answers[_currentIndex];
  Map<String, dynamic> get _currentQuestion => QuickQuiz[_currentAnswer.questionIndex];
  int get _totalQuestions => widget.answers.length;
  bool get _isLastQuestion => _currentIndex >= _totalQuestions - 1;
  void _goToNextQuestion() {
    if (_isLastQuestion) {
      _navigateToResults();
    } else {
      _moveToNextPage();
    }
  }
  void _moveToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToResults() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return TimeQuizResult(answers: widget.answers);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.easeInOut;
          final scaleTween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));
          final fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

          return FadeTransition(
            opacity: animation.drive(fadeTween),
            child: ScaleTransition(
              scale: animation.drive(scaleTween),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          _buildHeader(),
          _buildProgressSection(),
          _buildReviewContent(height),
        ],
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }
  Widget _buildBackground() {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/BG.png",
        fit: BoxFit.cover,
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
            "Review Question",
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
  Widget _buildProgressSection() {
    return Positioned(
      top: 100,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 140,
        decoration: BoxDecoration(
          color: const Color(0xFF4334B4).withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildProgressBar(),
            _buildQuizIcon(),
            _buildQuestionInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_totalQuestions, (index) {
        return Container(
          height: 3,
          width: 25,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: index <= _currentIndex ? Colors.white : Colors.grey,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }

  Widget _buildQuizIcon() {
    return Image.asset(
      "assets/images/1p.png",
      height: 50,
      width: 50,
    );
  }

  Widget _buildQuestionInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Question ${_currentIndex + 1}/$_totalQuestions",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          _currentQuestion["time"] ?? "00:00",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewContent(double height) {
    return Positioned(
      top: height * 0.32,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: PageView.builder(
          controller: _pageController,
          physics:  NeverScrollableScrollPhysics(),
          onPageChanged: _onPageChanged,
          itemCount: _totalQuestions,
          itemBuilder: (context, index) => _buildReviewPage(index),
        ),
      ),
    );
  }

  Widget _buildReviewPage(int index) {
    final answer = widget.answers[index];
    final question = QuickQuiz[answer.questionIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question["subject"] ?? "Subject",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            question["title"] ?? "Question",
            style: const TextStyle(
              color: Color(0xFF212121),
              fontSize: 16,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),

          _buildOptionCard(answer, "A", question["questionOne"] ?? ""),
          const SizedBox(height: 12),
          _buildOptionCard(answer, "B", question["questionTwo"] ?? ""),
          const SizedBox(height: 12),
          _buildOptionCard(answer, "C", question["questionThree"] ?? ""),
          const SizedBox(height: 12),
          _buildOptionCard(answer, "D", question["questionFour"] ?? ""),
        ],
      ),
    );
  }

  Widget _buildOptionCard(QuizAnswer answer, String label, String description) {
    final correctAnswer = answer.correctOption;
    final userAnswer = answer.selectedOption;
    final isCorrectOption = label == correctAnswer;
    final isUserAnswer = label == userAnswer;
    final isWrongAnswer = isUserAnswer && !answer.isCorrect;

    if (isCorrectOption) {
      return _buildCorrectAnswerCard(label, description);
    } else if (isWrongAnswer) {
      return _buildWrongAnswerCard(label, description);
    } else {
      return _buildNeutralOptionCard(label, description);
    }
  }
  Widget _buildNeutralOptionCard(String label, String description) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _buildSideLabel(
            label: label,
            bgColor: const Color(0xFFF8F9FD),
            textColor: Colors.black,
            borderColor: Colors.grey.shade300,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FD),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCorrectAnswerCard(String label, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              _buildSideLabel(
                label: label,
                bgColor: Colors.green,
                textColor: Colors.white,
                borderColor: Colors.green,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FD),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildTag("Correct Answer", Colors.green),
      ],
    );
  }

  // Build wrong answer card (red)
  Widget _buildWrongAnswerCard(String label, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              _buildSideLabel(
                label: label,
                bgColor: Colors.red,
                textColor: Colors.white,
                borderColor: Colors.red,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FD),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildTag("Your Answer", Colors.red),
      ],
    );
  }

  Widget _buildSideLabel({
    required String label,
    required Color bgColor,
    required Color textColor,
    required Color borderColor,
  }) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      height: 25,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "/MainScreen"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Quit Quiz",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _goToNextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4334B4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _isLastQuestion ? "View Results" : "Next Question",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}