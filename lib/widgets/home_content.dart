import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/CustomButton/bottomNavButton.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildTopCard(),
                        const SizedBox(height: 24),
                        _buildExamSection(),
                        const SizedBox(height: 16),
                        _buildQuestionOfTheDayButton(),
                      ],
                    ),
                  ),
                  _buildQuizModesSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            _buildProfileHeader(),
            const Divider(height: 2, color: Colors.grey),
            const SizedBox(height: 8),
            _buildTabs(),
            const SizedBox(height: 16),
            _buildTabContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
            child: ClipOval(
              child: Image.asset(AppImages.profile, fit: BoxFit.cover),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good Afternoon",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Time for tea or a quick study sesh?",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/sun.png", height: 58, width: 47),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTab("All Studying", 0),
          const SizedBox(width: 12),
          _buildTab("Question of the day", 1),
          const SizedBox(width: 12),
          _buildTab("30 Day Streak", 2),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 3,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildCalendarTab();
      case 1:
        return _buildQuestionOfTheDayTab();
      case 2:
        return _buildStreakTab();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildCalendarTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xFF4334B4),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  color: Color(0xFF4334B4),
                  fontWeight: FontWeight.bold,
                ),
                defaultTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                ),
                outsideTextStyle: TextStyle(color: Colors.white38),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: AppTextStyles.boldWhite16,
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Calendar Key:", style: AppTextStyles.smallWhite12bold),
              SizedBox(width: 8),
              Icon(Icons.circle, color: Colors.white, size: 10),
              SizedBox(width: 4),
              Text(
                "Studied",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionOfTheDayTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(AppImages.questionIcon, height: 60, width: 60),
            const SizedBox(height: 16),
            const Text("Question of the Day", style: AppTextStyles.boldWhite18),
            const SizedBox(height: 8),
            Text(
              "Complete today's featured question to maintain your streak!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.local_fire_department,
              color: Colors.orange,
              size: 60,
            ),
            const SizedBox(height: 16),
            const Text(
              "30 Day Streak Challenge",
              style: AppTextStyles.boldWhite18,
            ),
            const SizedBox(height: 8),
            Text(
              "Study consistently for 30 days to complete this challenge!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Current Streak: ",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Text("5 Days 🔥", style: AppTextStyles.boldWhite16),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select Exam", style: AppTextStyles.white16),
            InkWell(
              onTap: () => _showAddExamPopup(context),
              child: Text("Add Exam", style: AppTextStyles.boldWhite16),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF4334B4).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("AACN CCRN (Adult)", style: AppTextStyles.white16),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionOfTheDayButton() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/QuizPageView"),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF4334B4).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppImages.questionIcon, height: 41, width: 31),
                const SizedBox(width: 12),
                Text("Question of the day", style: AppTextStyles.boldWhite16),
              ],
            ),
            const Icon(Icons.arrow_forward_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizModesSection() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Quiz Modes", style: AppTextStyles.black16),
              InkWell(
                onTap: () => _showQuizSettingsPopup(context),
                child: const Text(
                  "Quiz Settings",
                  style: AppTextStyles.primaryBold16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, "/QuizPage"),
                child: _buildQuizModeCard("Quick 10", AppImages.mode1, const [
                  Color(0xFFDCFCF5),
                  Color(0xFFE2E4FC),
                ]),
              ),
              InkWell(
                onTap: () => _showTimeQuizPopup(context),
                child: _buildQuizModeCard("Timed Quiz", AppImages.mode2, const [
                  Color(0xFFFFFFFF),
                  Color(0xFFFFE3E5),
                ]),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, "/WeakSubject"),
                child: _buildQuizModeCard(
                  "Weak Subject",
                  AppImages.mode3,

                  const [Color(0xFFDCFCF5), Color(0xFFE2E4FC)],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildQuizModeCard("Mock Test", AppImages.mode4,  [
                Color(0xFFCDDAFD),
                Color(0xFFFFF1E6),
              ]),
              const SizedBox(width: 8),
              _buildQuizModeCard("Missed Question", AppImages.mode5, const [
                Color(0xFFEFD0D4),
                Color(0xFFDCFCF5),
              ]),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget 
  _buildQuizModeCard(
    String title,
    String imagePath,
    List<Color> gradientColors,
  ) {
    return Container(
      height: 125,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF212121),
                fontWeight: FontWeight.bold,
                fontSize: 12,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Please select your exam",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF212121),
                fontWeight: FontWeight.normal,
                fontSize: 9,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showTimeQuizPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      String selectedDifficulty = "Easy";
      double timeMinutes = 4;

      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Image.asset(AppImages.mode2, height: 80, width: 80),
                const SizedBox(height: 16),
                const Text("Time Quiz", style: AppTextStyles.boldblack18),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Difficulty Level",
                      style: AppTextStyles.semiblack14,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDifficultyOption(
                        "Easy",
                        selectedDifficulty == "Easy",
                        () => setState(() => selectedDifficulty = "Easy"),
                      ),
                      _buildDifficultyOption(
                        "Medium",
                        selectedDifficulty == "Medium",
                        () => setState(() => selectedDifficulty = "Medium"),
                      ),
                      _buildDifficultyOption(
                        "Hard",
                        selectedDifficulty == "Hard",
                        () => setState(() => selectedDifficulty = "Hard"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "How Many Minutes?",
                      style: AppTextStyles.semiblack14,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 50,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Text(
                    timeMinutes.toInt().toString(),
                    style: AppTextStyles.boldblack16,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Slider(
                    value: timeMinutes,
                    min: 1,
                    max: 60,
                    divisions: 59,
                    label: "${timeMinutes.toInt()} min",
                    activeColor: AppColors.primary,
                    onChanged: (newValue) {
                      setState(() => timeMinutes = newValue);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEFF3FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          title: "Close",
                          color: AppColors.closebuttonbackgroundcolor,
                          textColor: AppColors.redColor,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),

                      const SizedBox(width: 8),
                      Expanded(
                        child: Center(
                          child: AppButton(
                            title: "Start Quiz",
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, "/TimeQuizPage");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void _showAddExamPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Image.asset(AppImages.mode2, height: 80, width: 80),
              const SizedBox(height: 16),
              const Text(
                "Add Exam",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Category",
                    hintText: "Choose your exam category",
                    suffixIcon: const Icon(Icons.arrow_drop_down_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Your Exam Date",
                    hintText: "Select your exam date",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFEFF3FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        title: "Close",
                        color: AppColors.closebuttonbackgroundcolor,
                        textColor: AppColors.redColor,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),

                    SizedBox(width: 14),
                    Expanded(
                      child: AppButton(
                        title: "Continue",
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showQuizSettingsPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      bool showAnswersAsIGo = true;
      bool manualSubmit = true;

      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 40,
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 18),
                  Image.asset(AppImages.settingImage, height: 80, width: 80),
                  const SizedBox(height: 16),
                  const Text(
                    "Quiz Settings",
                    style: AppTextStyles.semiboldblack20,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "These controls will be default settings for all of your quiz modes.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.black14normal,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSettingOption(
                          "Show answers as I go",
                          showAnswersAsIGo,
                          () => setState(() => showAnswersAsIGo = true),
                        ),
                        const SizedBox(height: 16),
                        _buildSettingOption(
                          "Show answers at the end",
                          !showAnswersAsIGo,
                          () => setState(() => showAnswersAsIGo = false),
                        ),
                        const Divider(height: 32),
                        _buildSettingOption(
                          'Manual submit (Click "check answer" Button)',
                          manualSubmit,
                          () => setState(() => manualSubmit = true),
                        ),
                        const SizedBox(height: 16),
                        _buildSettingOption(
                          "Automatic submit (Click Answer)",
                          !manualSubmit,
                          () => setState(() => manualSubmit = false),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Adjust Subject",
                        style: AppTextStyles.boldblack16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Turn off a subject to hide all questions for that subject. It's helpful if your exam has optional subjects that you don't need to study for.",
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "All Subjects",
                        style: AppTextStyles.boldblack16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        _buildSubjectItem("IA. Cardiovascular", true),
                        const SizedBox(height: 12),
                        _buildSubjectItem("IB. Hematology", true),
                        SizedBox(height: 12),
                        _buildSubjectItem("IC. Pulmonary", false),
                        SizedBox(height: 12),
                        _buildSubjectItem("ID. Neurology", true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFF3FF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            title: "Close",
                            color: AppColors.redColor.withOpacity(0.20),
                            textColor: AppColors.redColor,

                            onTap: () => Navigator.pop(context),
                          ),
                        ),

                        const SizedBox(width: 12),
                        Expanded(
                          child: AppButton(
                            title: "Save Setting",
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildDifficultyOption(
  String title,
  bool isSelected,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          child: Center(
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: isSelected ? AppColors.primary : Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

// Setting Option (Radio Button Style)
Widget _buildSettingOption(String title, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          child: Center(
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(title, style: AppTextStyles.black14normal)),
      ],
    ),
  );
}

Widget _buildSubjectItem(String title, bool isChecked) {
  return Row(
    children: [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 1.4),
          borderRadius: BorderRadius.circular(4),
        ),
        child: isChecked
            ? const Icon(Icons.check, size: 16, color: AppColors.primary)
            : null,
      ),
      const SizedBox(width: 10),
      Text(title, style: AppTextStyles.black14normal),
    ],
  );
}
