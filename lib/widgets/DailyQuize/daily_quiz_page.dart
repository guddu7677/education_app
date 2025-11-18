import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class QuizQuestion {
  final String title;
  final String subject;
  final String question;
  final List<QuizOption> options;
  final String correctAnswer;
  final String explanation;

  QuizQuestion({
    required this.title,
    required this.subject,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
}

class QuizOption {
  final String label;
  final String description;

  QuizOption({required this.label, required this.description});
}

final List<QuizQuestion> quizData = [
  QuizQuestion(
    title: "Physics Fundamentals",
    subject: "Physics",
    question: "What is Newton's First Law of Motion?",
    options: [
      QuizOption(
        label: "A",
        description: "An object at rest stays at rest and an object in motion stays in motion with the same speed and direction unless acted upon by an unbalanced force.",
      ),
      QuizOption(
        label: "B",
        description: "The acceleration of an object depends on the mass of the object and the amount of force applied.",
      ),
      QuizOption(
        label: "C",
        description: "For every action, there is an equal and opposite reaction.",
      ),
      QuizOption(
        label: "D",
        description: "Energy can neither be created nor destroyed, only transformed from one form to another.",
      ),
    ],
    correctAnswer: "A",
    explanation: "Newton's First Law, also known as the Law of Inertia, states that objects maintain their state of motion unless an external force acts upon them.",
  ),

];

class QuizPageView extends StatefulWidget {
  const QuizPageView({super.key});

  @override
  State<QuizPageView> createState() => _QuizPageViewState();
}

class _QuizPageViewState extends State<QuizPageView> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  Map<int, String?> userAnswers = {}; 
  Map<int, bool> answersChecked = {}; 

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:BackGroundColor.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
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
                const SizedBox(width: 100),
                const Text(
                  "Daily Quiz",
                  style: AppTextStyles.White20bold
                ),
              ],
            ),
          ),

          PageView.builder(
           physics:  NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: quizData.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildQuizPage(quizData[index], index, height);
            },
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                quizData.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _getButtonAction(),
              style: ElevatedButton.styleFrom(
                backgroundColor: _getButtonColor(),
                disabledBackgroundColor:
                     Color(0xFF4334B4).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                _getButtonText(),
                style: AppTextStyles.boldWhite16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizPage(QuizQuestion quiz, int pageIndex, double height) {
    bool isAnswerChecked = answersChecked[pageIndex] ?? false;
    String? userAnswer = userAnswers[pageIndex];

    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 16,
          right: 16,
          child: Container(
            padding: EdgeInsets.all(16),
            height: 220,
            decoration: BoxDecoration(
              color:Color(0xFF4334B4).withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(AppImages.calenderImage, height: 50, width: 50),
                Text(
                  quiz.title,
                  style:AppTextStyles.White20bold
                ),
                Text(
                  quiz.question,
                  textAlign: TextAlign.center,
                  style:AppTextStyles.White14bold
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height * 0.43,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ...quiz.options.map((option) {
                    if (isAnswerChecked) {
                      if (option.label == quiz.correctAnswer) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: _buildCorrectAnswerCard(
                            option.label,
                            option.description,
                            quiz.explanation,
                            userAnswer == option.label,
                          ),
                        );
                      } else if (option.label == userAnswer) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: _buildWrongAnswerCard(
                            option.label,
                            option.description,
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _buildOptionCard(
                            option.label,
                            option.description,
                            false,
                            pageIndex,
                          ),
                        );
                      }
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: _buildOptionCard(
                          option.label,
                          option.description,
                          userAnswer == option.label,
                          pageIndex,
                        ),
                      );
                    }
                  }).toList(),
                  const SizedBox(height: 30),
                  _buildActionButtons(isAnswerChecked),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard(
      String label, String description, bool isSelected, int pageIndex) {
    Color borderColor = isSelected ? Colors.grey : Colors.grey.shade300;

    return GestureDetector(
      onTap: () {
        if (!(answersChecked[pageIndex] ?? false)) {
          setState(() {
            userAnswers[pageIndex] = label;
          });
        }
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF8F9FD),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                border: Border.all(
                  color: borderColor,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Center(
                child: Text(label, style: AppTextStyles.boldblack16),
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
                    top: BorderSide(color: borderColor, width: isSelected ? 2 : 1),
                    right: BorderSide(color: borderColor, width: isSelected ? 2 : 1),
                    bottom: BorderSide(color: borderColor, width: isSelected ? 2 : 1),
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
    );
  }

  Widget _buildCorrectAnswerCard(
      String label, String description, String explanation, bool isUserAnswer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border.all(color: GreenBorder.greenBorder, width: 2),
                ),
                child: Center(
                  child: Text(
                    label,
                    style:AppTextStyles.boldblack16,
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
                    ),
                    border: const Border(
                      top: BorderSide(color: GreenBorder.greenBorder, width: 2),
                      right: BorderSide(color: GreenBorder.greenBorder, width: 2),
                      bottom: BorderSide(color: GreenBorder.greenBorder, width: 2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style:AppTextStyles.subtile14black2121,
                      ),
                     SizedBox(height: 12),
                     Text(
                        "Explanation:",
                        style: TextStyle(
                          color: Color(0xFF4334B4),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                     SizedBox(height: 8),
                      Text(
                        explanation,
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border(
              bottom: BorderSide(color: GreenBorder.greenBorder,),
              left: BorderSide(color: GreenBorder.greenBorder,),
              right: BorderSide(color: GreenBorder.greenBorder,),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              isUserAnswer ? "Your Answer ✓" : "Correct Answer",
              style: AppTextStyles.semiboldWhite16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWrongAnswerCard(String label, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border.all(color: RedBordersidecolor.redBorderdSide, width: 2),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F9FD),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                    border: Border(
                      top: BorderSide(color:RedBordersidecolor.redBorderdSide, width: 2),
                      right: BorderSide(color: RedBordersidecolor.redBorderdSide, width: 2),
                      bottom: BorderSide(color: RedBordersidecolor.redBorderdSide,width: 2),
                    ),
                  ),
                  child: Text(
                    description,
                    style:AppTextStyles.subtile14black2121
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.redColor,
            border: Border(
              bottom: BorderSide(color:RedBordersidecolor.redBorderdSide),
              left: BorderSide(color:RedBordersidecolor.redBorderdSide,),
              right: BorderSide(color: RedBordersidecolor.redBorderdSide,),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              "Your Answer",
              style: AppTextStyles.smallblack12bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isAnswerChecked) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF4334B4)),
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFF4334B4).withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(AppImages.mode6, "Community Stats",
              !isAnswerChecked),
          _buildActionButton(AppImages.mode7, "Flag", false),
          _buildActionButton(AppImages.mode8, "Share", false),
        ],
      ),
    );
  }

  Widget _buildActionButton(String iconPath, String label, bool isDisabled) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: isDisabled ? Colors.white.withOpacity(0.4) : Colors.white,
            ),
            child: Image.asset(iconPath),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isDisabled
                ? Color(0xFF4334B4).withOpacity(0.4)
                : Color(0xFF4334B4),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  String _getButtonText() {
    bool isAnswerChecked = answersChecked[currentPage] ?? false;
    bool isLastPage = currentPage == quizData.length - 1;

    if (isAnswerChecked) {
      return isLastPage ? "Back to Home" : "Next Question";
    }
    return "Check Answer";
  }

  Color _getButtonColor() {
    bool isAnswerChecked = answersChecked[currentPage] ?? false;
    String? userAnswer = userAnswers[currentPage];

    if (!isAnswerChecked && userAnswer == null) {
      return const Color(0xFF4334B4).withOpacity(0.4);
    }
    return const Color(0xFF4334B4);
  }

  VoidCallback? _getButtonAction() {
    bool isAnswerChecked = answersChecked[currentPage] ?? false;
    String? userAnswer = userAnswers[currentPage];
    bool isLastPage = currentPage == quizData.length - 1;

    if (!isAnswerChecked && userAnswer == null) {
      return null; 
    }

    if (!isAnswerChecked) {
      return () {
        setState(() {
          answersChecked[currentPage] = true;
        });
      };
    } else {
      return () {
        if (isLastPage) {
          Navigator.pushNamed(context, "/MainScreen");
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      };
    }
  }
}