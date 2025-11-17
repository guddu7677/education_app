import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

// Quiz data model
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
  QuizQuestion(
    title: "Mathematics",
    subject: "Algebra",
    question: "What is the value of x in the equation: 2x + 5 = 15?",
    options: [
      QuizOption(label: "A", description: "x = 3"),
      QuizOption(label: "B", description: "x = 5"),
      QuizOption(label: "C", description: "x = 7"),
      QuizOption(label: "D", description: "x = 10"),
    ],
    correctAnswer: "B",
    explanation: "Subtracting 5 from both sides: 2x = 10. Dividing both sides by 2: x = 5.",
  ),
  QuizQuestion(
    title: "Biology",
    subject: "Cell Biology",
    question: "What is the powerhouse of the cell?",
    options: [
      QuizOption(label: "A", description: "Nucleus - controls cell activities"),
      QuizOption(label: "B", description: "Ribosome - synthesizes proteins"),
      QuizOption(label: "C", description: "Mitochondria - produces energy (ATP)"),
      QuizOption(label: "D", description: "Endoplasmic Reticulum - transports materials"),
    ],
    correctAnswer: "C",
    explanation: "Mitochondria are known as the powerhouse of the cell because they generate most of the cell's ATP through cellular respiration.",
  ),
  QuizQuestion(
    title: "Chemistry",
    subject: "Periodic Table",
    question: "What is the chemical symbol for Gold?",
    options: [
      QuizOption(label: "A", description: "Go"),
      QuizOption(label: "B", description: "Gd"),
      QuizOption(label: "C", description: "Au"),
      QuizOption(label: "D", description: "Ag"),
    ],
    correctAnswer: "C",
    explanation: "Gold's symbol 'Au' comes from its Latin name 'Aurum', meaning 'shining dawn'.",
  ),
  QuizQuestion(
    title: "History",
    subject: "World History",
    question: "In which year did World War II end?",
    options: [
      QuizOption(label: "A", description: "1943"),
      QuizOption(label: "B", description: "1944"),
      QuizOption(label: "C", description: "1945"),
      QuizOption(label: "D", description: "1946"),
    ],
    correctAnswer: "C",
    explanation: "World War II ended in 1945 with Germany's surrender in May and Japan's surrender in September.",
  ),
  QuizQuestion(
    title: "Geography",
    subject: "World Geography",
    question: "What is the largest ocean on Earth?",
    options: [
      QuizOption(label: "A", description: "Atlantic Ocean"),
      QuizOption(label: "B", description: "Indian Ocean"),
      QuizOption(label: "C", description: "Arctic Ocean"),
      QuizOption(label: "D", description: "Pacific Ocean"),
    ],
    correctAnswer: "D",
    explanation: "The Pacific Ocean is the largest ocean, covering approximately 63 million square miles.",
  ),
  QuizQuestion(
    title: "Computer Science",
    subject: "Programming",
    question: "What does HTML stand for?",
    options: [
      QuizOption(label: "A", description: "Hyper Text Markup Language"),
      QuizOption(label: "B", description: "High Tech Modern Language"),
      QuizOption(label: "C", description: "Home Tool Markup Language"),
      QuizOption(label: "D", description: "Hyperlinks and Text Markup Language"),
    ],
    correctAnswer: "A",
    explanation: "HTML stands for Hyper Text Markup Language, the standard language for creating web pages.",
  ),
  QuizQuestion(
    title: "English Literature",
    subject: "Shakespeare",
    question: "Who wrote 'Romeo and Juliet'?",
    options: [
      QuizOption(label: "A", description: "Charles Dickens"),
      QuizOption(label: "B", description: "William Shakespeare"),
      QuizOption(label: "C", description: "Jane Austen"),
      QuizOption(label: "D", description: "Mark Twain"),
    ],
    correctAnswer: "B",
    explanation: "William Shakespeare wrote 'Romeo and Juliet' around 1594-1596, one of his most famous tragedies.",
  ),
  QuizQuestion(
    title: "Economics",
    subject: "Basic Economics",
    question: "What is inflation?",
    options: [
      QuizOption(
        label: "A",
        description: "The rate at which the general level of prices for goods and services is rising.",
      ),
      QuizOption(label: "B", description: "The decrease in unemployment rate."),
      QuizOption(label: "C", description: "The increase in stock market prices."),
      QuizOption(label: "D", description: "The growth of GDP over time."),
    ],
    correctAnswer: "A",
    explanation: "Inflation is the rate at which prices increase over time, reducing purchasing power.",
  ),
  QuizQuestion(
    title: "Art History",
    subject: "Renaissance Art",
    question: "Who painted the Mona Lisa?",
    options: [
      QuizOption(label: "A", description: "Michelangelo"),
      QuizOption(label: "B", description: "Leonardo da Vinci"),
      QuizOption(label: "C", description: "Raphael"),
      QuizOption(label: "D", description: "Vincent van Gogh"),
    ],
    correctAnswer: "B",
    explanation: "Leonardo da Vinci painted the Mona Lisa between 1503 and 1519, one of the most famous paintings in history.",
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
      backgroundColor: Colors.white,
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
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
                Image.asset("assets/images/gp.png", height: 50, width: 50),
                Text(
                  quiz.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  quiz.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
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
                color: const Color(0xFFF8F9FD),
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
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
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
                    ),
                    border: const Border(
                      top: BorderSide(color: Colors.green, width: 2),
                      right: BorderSide(color: Colors.green, width: 2),
                      bottom: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 14,
                          height: 1.4,
                        ),
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
              bottom: BorderSide(color: Colors.green),
              left: BorderSide(color: Colors.green),
              right: BorderSide(color: Colors.green),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              isUserAnswer ? "Your Answer ✓" : "Correct Answer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
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
                  border: Border.all(color: Colors.red, width: 2),
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
                      top: BorderSide(color: Colors.red, width: 2),
                      right: BorderSide(color: Colors.red, width: 2),
                      bottom: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  child: Text(
                    description,
                    style: TextStyle(
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
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border(
              bottom: BorderSide(color: Colors.red),
              left: BorderSide(color: Colors.red),
              right: BorderSide(color: Colors.red),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              "Your Answer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
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
          _buildActionButton("assets/images/6p.png", "Community Stats",
              !isAnswerChecked),
          _buildActionButton("assets/images/7p.png", "Flag", false),
          _buildActionButton("assets/images/8p.png", "Share", false),
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