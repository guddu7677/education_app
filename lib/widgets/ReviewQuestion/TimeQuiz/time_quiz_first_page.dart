import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/widgets/ReviewQuestion/TimeQuiz/time_quiz_second_page.dart';
import 'package:flutter/material.dart';

class QuizAnswer {
  final int questionIndex;
  final String selectedOption;
  final String correctOption;

  QuizAnswer({
    required this.questionIndex,
    required this.selectedOption,
    required this.correctOption,
  });

  bool get isCorrect => selectedOption == correctOption;
}

final List<Map<String, dynamic>> QuickQuiz = [
  {
    "title": "What is the capital of France?",
    "time": "09:59",
    "subject": "Geography",
    "questionOne": "Paris",
    "questionTwo": "London",
    "questionThree": "Berlin",
    "questionFour": "Madrid",
    "correctAnswer": "A"
  },
  {
    "title": "What is 2 + 2?",
    "time": "10:00",
    "subject": "Mathematics",
    "questionOne": "3",
    "questionTwo": "4",
    "questionThree": "5",
    "questionFour": "6",
    "correctAnswer": "B"
  },
  {
    "title": "Who wrote Romeo and Juliet?",
    "time": "10:01",
    "subject": "Literature",
    "questionOne": "Charles Dickens",
    "questionTwo": "William Shakespeare",
    "questionThree": "Jane Austen",
    "questionFour": "Mark Twain",
    "correctAnswer": "B"
  },
  {
    "title": "What is the largest planet?",
    "time": "10:02",
    "subject": "Science",
    "questionOne": "Mars",
    "questionTwo": "Earth",
    "questionThree": "Jupiter",
    "questionFour": "Saturn",
    "correctAnswer": "C"
  },
  {
    "title": "What year did World War II end?",
    "time": "10:03",
    "subject": "History",
    "questionOne": "1943",
    "questionTwo": "1944",
    "questionThree": "1945",
    "questionFour": "1946",
    "correctAnswer": "C"
  },
  {
    "title": "What is the chemical symbol for water?",
    "time": "10:04",
    "subject": "Chemistry",
    "questionOne": "H2O",
    "questionTwo": "CO2",
    "questionThree": "O2",
    "questionFour": "N2",
    "correctAnswer": "A"
  },
  {
    "title": "Which continent is Egypt in?",
    "time": "10:05",
    "subject": "Geography",
    "questionOne": "Asia",
    "questionTwo": "Africa",
    "questionThree": "Europe",
    "questionFour": "South America",
    "correctAnswer": "B"
  },
  {
    "title": "What is the speed of light?",
    "time": "10:06",
    "subject": "Physics",
    "questionOne": "300,000 km/s",
    "questionTwo": "150,000 km/s",
    "questionThree": "500,000 km/s",
    "questionFour": "200,000 km/s",
    "correctAnswer": "A"
  },
  {
    "title": "Who painted the Mona Lisa?",
    "time": "10:07",
    "subject": "Art",
    "questionOne": "Vincent van Gogh",
    "questionTwo": "Pablo Picasso",
    "questionThree": "Leonardo da Vinci",
    "questionFour": "Michelangelo",
    "correctAnswer": "C"
  },
  {
    "title": "What is the smallest prime number?",
    "time": "10:08",
    "subject": "Mathematics",
    "questionOne": "0",
    "questionTwo": "1",
    "questionThree": "2",
    "questionFour": "3",
    "correctAnswer": "C"
  },
];

class TimeQuizPage extends StatefulWidget {
  const TimeQuizPage({super.key});

  @override
  State<TimeQuizPage> createState() => _TimeQuizPageState();
}

class _TimeQuizPageState extends State<TimeQuizPage> {
  late PageController _pageController;
  int _currentIndex = 0;
  final List<String?> _selectedOptions = List.filled(QuickQuiz.length, null);
  final List<QuizAnswer> _answers = [];

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
  Map<String, dynamic> get _currentQuestion => QuickQuiz[_currentIndex];
  int get _totalQuestions => QuickQuiz.length;
  bool get _isLastQuestion => _currentIndex >= _totalQuestions - 1;
  void _submitAnswer() {
    if (_selectedOptions[_currentIndex] == null) {
      _showSnackBar('Please select an answer');
      return;
    }
      final answer = QuizAnswer(
      questionIndex: _currentIndex,
      selectedOption: _selectedOptions[_currentIndex]!,
      correctOption: _currentQuestion["correctAnswer"] ?? "A",
    );
    _answers.add(answer);
    if (_isLastQuestion) {
      _navigateToReview();
    } else {
      _goToNextQuestion();
    }
  }
  void _goToNextQuestion() {
  setState(() {
    _pageController.jumpToPage(_currentIndex + 1); 
  });
}


  void _navigateToReview() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return TimeQuizReviewPage(answers: _answers);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  void _selectOption(int questionIndex, String option) {
    setState(() {
      _selectedOptions[questionIndex] = option;
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
          _buildQuestionContent(height),
        ],
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: Image.asset(
        AppImages.background,
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
            child:Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
           Spacer(),
           Text(
            "Quick Quiz",
            style:AppTextStyles.White20bold,
          ),
           Spacer(flex: 2),
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
        padding: EdgeInsets.all(16),
        height: 140,
        decoration: BoxDecoration(
          color: Color(0xFF4334B4).withOpacity(0.15),
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
          margin: EdgeInsets.symmetric(horizontal: 2),
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
      AppImages.mode2,
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
          style: AppTextStyles.White20bold,
        ),
        Text(
          _currentQuestion["time"] ?? "00:00",
          style: AppTextStyles.White20bold,
        ),
      ],
    );
  }
 Widget _buildQuestionContent(double height) {
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
          itemBuilder: (context, index) => _buildQuestionPage(index),
        ),
      ),
    );
  }
  Widget _buildQuestionPage(int index) {
    final question = QuickQuiz[index];

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question["subject"] ?? "Subject",
            style: AppTextStyles.boldblack16,
          ),
         SizedBox(height: 8),
          Text(
            question["title"] ?? "Question",
            style: TextStyle(
              color: Color(0xFF212121),
              fontSize: 16,
              height: 1.4,
            ),
          ),
           SizedBox(height: 24),
          _buildOptionCard(index, "A", question["questionOne"] ?? ""),
           SizedBox(height: 12),
          _buildOptionCard(index, "B", question["questionTwo"] ?? ""),
           SizedBox(height: 12),
          _buildOptionCard(index, "C", question["questionThree"] ?? ""),
           SizedBox(height: 12),
          _buildOptionCard(index, "D", question["questionFour"] ?? ""),
        ],
      ),
    );
  }
Widget _buildOptionCard(int questionIndex, String label, String description) {
    final isSelected = _selectedOptions[questionIndex] == label;
    return GestureDetector(
      onTap: () => _selectOption(questionIndex, label),
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
                  color: isSelected ? Colors.grey : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
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
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:Color(0xFFF8F9FD),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border.all(
                    color: isSelected ? Colors.grey : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
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
    );
  }

  Widget _buildBottomButtons() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
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
                  child: Text(
                    "Quit Quiz",
                    style: AppTextStyles.semiboldWhite16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4334B4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _isLastQuestion ? "Submit" : "Next",
                 style: AppTextStyles.semiboldWhite16,

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