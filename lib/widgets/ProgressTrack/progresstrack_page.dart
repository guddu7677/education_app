import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

class ProgresstrackPage extends StatefulWidget {
  const ProgresstrackPage({super.key});

  @override
  State<ProgresstrackPage> createState() => _ProgresstrackPageState();
}

class _ProgresstrackPageState extends State<ProgresstrackPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            fit: BoxFit.cover,
            height: height,
            width: double.infinity,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildQuizResultCard(),
                  const SizedBox(height: 20),
                  _buildMainContent(),
                  const SizedBox(height: 20),
                  _studyActivity(),
                  const SizedBox(height: 30),
                  _quizScore(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// -------------------- HEADER --------------------
  Widget _buildHeader() {
    return Row(
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
          "Progress Tracking",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }

  /// -------------------- QUIZ RESULT CARD --------------------
  Widget _buildQuizResultCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SemicircularIndicator(
            strokeWidth: 10,
            radius: 60,
            progress: 0.5,
            color: AppColors.primary,
            backgroundColor: Colors.grey.shade300,
            child: const Text(
              "50%",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildResultRow(
            icon: Image.asset("assets/images/vec1.png", height: 18),
            value: "5/10",
            label: "Answered Correctly",
          ),
          const SizedBox(height: 10),
          _buildResultRow(
            icon: Image.asset("assets/images/vec3.png", height: 18),
            value: "40",
            label: "Unanswered",
          ),
          const SizedBox(height: 10),
          _buildResultRow(
            icon: Image.asset("assets/images/vec.png", height: 18),
            value: "22s",
            label: "Time Spent Studying",
          ),
          const SizedBox(height: 10),
          _buildResultRow(
            icon: Image.asset("assets/images/vec4.png", height: 18),
            value: "16",
            label: "Days Until Exam",
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow({
    required Widget icon,
    required String value,
    required String label,
  }) {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF3FF),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(child: icon),
        ),
        const SizedBox(width: 8),
        Text(value, style: AppTextStyles.smallblack12bold),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.smallblack12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// -------------------- SUBJECT INSIGHTS --------------------
  Widget _buildMainContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subject Insights", style: AppTextStyles.boldblack16),
              Text("Correct / Answered", style: AppTextStyles.smallblack14),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 1),

          ...List.generate(6, (_) => _subjectScore()),
        ],
      ),
    );
  }

  Widget _subjectScore() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Subject name and total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("IA. Cardiovascular", style: AppTextStyles.smallblack14),
              Text("3/5", style: AppTextStyles.smallblack14),
            ],
          ),
          const SizedBox(height: 6),

          /// Subject score details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subject Score", style: AppTextStyles.smallblack12),
              Text("75%", style: AppTextStyles.smallblack12),
            ],
          ),
          const SizedBox(height: 6),

          /// Progress bar
          LinearPercentIndicator(
            lineHeight: 6,
            percent: 0.75,
            progressColor: AppColors.primary,
            backgroundColor: Colors.grey.shade300,
            barRadius: const Radius.circular(8),
            animation: true,
          ),

          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }

  /// -------------------- STUDY ACTIVITY SECTION --------------------
  Widget _studyActivity() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Study Activity", style: AppTextStyles.boldblack16),
          const SizedBox(height: 10),
          Divider(),
          SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.mode1, cacheHeight: 30, cacheWidth: 30),
                  SizedBox(width: 4),
                  Text("Quick 10", style: AppTextStyles.smallblack14),
                ],
              ),
              Row(
                children: [
                  Text("Oct 14", style: AppTextStyles.smallblack14),
                  SizedBox(width: 4),

                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF4334B4).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text("50%", style: AppTextStyles.smallblack14),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Divider(),
          SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.mode2, cacheHeight: 30, cacheWidth: 30),
                  SizedBox(width: 4),
                  Text("Timed Quiz", style: AppTextStyles.smallblack14),
                ],
              ),
              Row(
                children: [
                  Text("Oct 14", style: AppTextStyles.smallblack14),
                  SizedBox(width: 4),

                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF4334B4).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text("50%", style: AppTextStyles.smallblack14),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Divider(),
          SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.questionIcon, cacheHeight: 30, cacheWidth: 30),
                  SizedBox(width: 4),
                  Text(
                    "Question of the day",
                    style: AppTextStyles.smallblack14,
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Oct 14", style: AppTextStyles.smallblack14),
                  SizedBox(width: 4),
                  Icon(Icons.close, color: Colors.red, size: 30),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Divider(),
          SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.questionIcon, cacheHeight: 30, cacheWidth: 30),
                  SizedBox(width: 4),
                  Text(
                    "Question of the day",
                    style: AppTextStyles.smallblack14,
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Oct 13", style: AppTextStyles.smallblack14),
                  SizedBox(width: 4),

                  Icon(Icons.check, color: Colors.green, size: 30),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Divider(),
          SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.questionIcon, cacheHeight: 30, cacheWidth: 30),
                  SizedBox(width: 4),
                  Text(
                    "Question of the day",
                    style: AppTextStyles.smallblack14,
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Oct 14", style: AppTextStyles.smallblack14),
                  SizedBox(width: 4),
                  Icon(Icons.close, color: Colors.red, size: 30),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
 Widget _quizScore() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quiz Score", style: AppTextStyles.boldblack16),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),

          SizedBox(
            height: 260, // increased height for label visibility
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Y-Axis Labels
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("100%", style: TextStyle(fontSize: 12)),
                    Text("75%", style: TextStyle(fontSize: 12)),
                    Text("50%", style: TextStyle(fontSize: 12)),
                    Text("25%", style: TextStyle(fontSize: 12)),
                    Text("0%", style: TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(width: 8),

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double chartHeight = constraints.maxHeight;

                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ...List.generate(5, (index) {
                            double y = chartHeight / 4 * index;
                            return Positioned(
                              bottom: y,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 1,
                                color: Colors.grey.shade300,
                              ),
                            );
                          }),

                          /// Bars and label
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildBar(height: 80, color: Colors.grey.shade400),
                                _buildBar(height: 110, color: Colors.grey.shade400),
                                Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topCenter,
                                  children: [
                                    _buildBar(
                                        height: 180, color: const Color(0xFF4334B4)),
                                    Positioned(
                                      top: -55,
                                      child: Column(
                                        children: const [
                                          Text(
                                            "50% Score",
                                            style: TextStyle(
                                              color: Color(0xFF4334B4),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "Monday, April 22nd",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                _buildBar(height: 100, color: Colors.grey.shade400),
                                _buildBar(height: 80, color: Colors.grey.shade400),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar({required double height, required Color color}) {
    return Container(
      width: 26,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

}
