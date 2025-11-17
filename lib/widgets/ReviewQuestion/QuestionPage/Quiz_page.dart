import 'package:education_app/widgets/ReviewQuestion/QuestionPage/Quiz_result_page.dart';
import 'package:flutter/material.dart';

class QuizQuestion {
  final String subject;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.subject,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}
final List<QuizQuestion> quizData = [
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
];


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  List<int?> userAnswers = List.filled(10, null);
  DateTime? quizStartTime;

  @override
  void initState() {
    super.initState();
    quizStartTime = DateTime.now();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectAnswer(int questionIndex, int optionIndex) {
    setState(() {
      userAnswers[questionIndex] = optionIndex;
    });
  }

  void _nextPage() {
    if (currentPage < 9) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _showResultPage();
    }
  }

  void _showResultPage() {
    final quizEndTime = DateTime.now();
    final duration = quizEndTime.difference(quizStartTime!);
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultPage(
          userAnswers: userAnswers,
          quizDuration: duration,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF4334B4), Color(0xFF6A5AE0)],
                ),
              ),
            ),
          ),
          Positioned(
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
                  "Quick Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF4334B4).withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(10, (index) {
                      return Container(
                        height: 3,
                        width: 25,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: userAnswers[index] != null
                              ? Colors.white
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Question ${currentPage + 1}/10",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.28,
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
               physics:  NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildQuestionPage(index);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _canProceed() ? _nextPage : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _canProceed()
                    ? const Color(0xFF4334B4)
                    : const Color(0xFF4334B4).withOpacity(0.4),
                disabledBackgroundColor:
                    const Color(0xFF4334B4).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                currentPage == 9 ? "Submit" : "Next",
                style: const TextStyle(
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

  bool _canProceed() {
    return userAnswers[currentPage] != null;
  }

  Widget _buildQuestionPage(int questionIndex) {
    final question = quizData[questionIndex];
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuestionCard(questionIndex, question),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(int questionIndex, QuizQuestion question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF4334B4).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Q${questionIndex + 1}",
                style: const TextStyle(
                  color: Color(0xFF4334B4),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              question.subject,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Text(
          question.question,
          style: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),

        ...List.generate(4, (optionIndex) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildOptionCard(
              String.fromCharCode(65 + optionIndex),
              question.options[optionIndex],
              userAnswers[questionIndex] == optionIndex,
              () => _selectAnswer(questionIndex, optionIndex),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildOptionCard(
      String label, String description, bool isSelected, VoidCallback onTap) {
    Color borderColor = isSelected ? const Color(0xFF4334B4) : Colors.grey.shade300;

    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF4334B4)
                    : const Color(0xFFF8F9FD),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                border: Border.all(
                  color: borderColor,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                  border: Border(
                    top: BorderSide(
                      color: borderColor,
                      width: isSelected ? 2 : 1,
                    ),
                    right: BorderSide(
                      color: borderColor,
                      width: isSelected ? 2 : 1,
                    ),
                    bottom: BorderSide(
                      color: borderColor,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
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
    );
  }
}