import 'package:education_app/constants/app_constant.dart';
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
    subject: "General Knowladge",
    question: "what is your name",
    options: ["Nawal kishor", "fhjjfgj gjg jghjg", "uykiyky kkuk ky kh", "gjuggk yky kyk liy"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 3,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["questtrterion", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 2,
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
    correctAnswerIndex: 2,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 3,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    subject: "subject",
    question: "question",
    options: ["question", "fhjjfgj gjg jghjg", "uykiyky kkuk ky ku", "gjuggk yky kyk liy"],
    correctAnswerIndex: 2,
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
  bool isSubmitted = false;

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
    if (!isSubmitted) {
      setState(() {
        userAnswers[questionIndex] = optionIndex;
      });
    }
  }
void _nextPage() {
  if (currentPage < 9) {
    setState(() {
      isSubmitted = false; 
    });
    
    _pageController.jumpToPage(currentPage + 1);
    
  } else {
    _showResultPage();
  }
}

  void _submitAnswer() {
    setState(() {
      isSubmitted = true;
    });
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
      backgroundColor: BackGroundColor.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
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
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const Spacer(),
                const Text(
                  "Quick Quiz",
                  style: AppTextStyles.semiboldWhite20
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
                color: AppColors.primary.withOpacity(0.15),
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
                    style: AppTextStyles.boldWhite18,
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
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                    isSubmitted = false;
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
              onPressed: _canProceed() 
                  ? (isSubmitted ? _nextPage : _submitAnswer)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _canProceed()
                    ? AppColors.primary
                    : AppColors.primary.withOpacity(0.4),
                disabledBackgroundColor:
                    AppColors.primary.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                isSubmitted
                    ? (currentPage == 9 ? "View Results" : "Next")
                    : "Submit",
                style: AppTextStyles.semiboldWhite16,
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
              style: AppTextStyles.subtile14black2121,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          question.question,
          style:AppTextStyles.smibold16black2121,
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
              questionIndex,
              optionIndex,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildOptionCard(
    String label,
    String description,
    bool isSelected,
    VoidCallback onTap,
    int questionIndex,
    int optionIndex,
  ) {
    final correctAnswerIndex = quizData[questionIndex].correctAnswerIndex;
    final isCorrectAnswer = optionIndex == correctAnswerIndex;
    final isUserAnswer = userAnswers[questionIndex] == optionIndex;

    Color borderColor;
    Color backgroundColor;
    Color textColor;

    if (isSubmitted) {
      if (isCorrectAnswer) {
        borderColor = Colors.green;
        backgroundColor = Colors.green;
        textColor = Colors.white;
      } else if (isUserAnswer) {
        borderColor = Colors.red;
        backgroundColor = Colors.red;
        textColor = Colors.white;
      } else {
        borderColor = Colors.grey.shade300;
        backgroundColor = const Color(0xFFF8F9FD);
        textColor = Colors.black;
      }
    } else {
      if (isSelected) {
        borderColor = Colors.grey.shade600;
        backgroundColor = const Color(0xFFF8F9FD);
        textColor = Colors.black;
      } else {
        borderColor = Colors.grey.shade300;
        backgroundColor = const Color(0xFFF8F9FD);
        textColor = Colors.black;
      }
    }

    return GestureDetector(
      onTap: isSubmitted ? null : onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      
                      bottomLeft: Radius.circular(
                        isSubmitted && (isCorrectAnswer || isUserAnswer) ? 12 : 12,
                      ),
                    ),
                    border: Border.all( 
                      color: borderColor,
                      width: (isSubmitted && (isCorrectAnswer || isUserAnswer)) ? 2 : 
                              (isSelected && !isSubmitted) ? 2 : 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
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
                      borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(12),
                        bottomRight: Radius.circular(
                          isSubmitted && (isCorrectAnswer || isUserAnswer) ? 0 : 12,
                        ),
                      ),
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide(
                          color: borderColor,
                          width: (isSubmitted && (isCorrectAnswer || isUserAnswer)) ? 2 : 
                                  (isSelected && !isSubmitted) ? 2 : 1,
                        ),
                        right: BorderSide(
                          color: borderColor,
                          width: (isSubmitted && (isCorrectAnswer || isUserAnswer)) ? 2 : 
                                  (isSelected && !isSubmitted) ? 2 : 1,
                        ),
                        bottom: BorderSide(
                          color: borderColor,
                          width: (isSubmitted && (isCorrectAnswer || isUserAnswer)) ? 2 : 
                                  (isSelected && !isSubmitted) ? 2 : 1,
                        ),
                      ),
                    ),
                    child: Text(
                      description,
                      style: AppTextStyles.subtile14black2121,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isSubmitted && isCorrectAnswer)
            _buildAnswerTag("Correct Answer", Colors.green),
          if (isSubmitted && isUserAnswer && !isCorrectAnswer)
            _buildAnswerTag("Your Answer", Colors.red),
        ],
      ),
    );
  }

  Widget _buildAnswerTag(String text, Color color) {
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.semilWhite12
        ),
      ),
    );
  }
}