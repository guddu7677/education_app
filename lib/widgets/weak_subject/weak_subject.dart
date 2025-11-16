import 'package:education_app/constants/app_constant.dart';
import 'package:flutter/material.dart';

class WeakSubject extends StatefulWidget {
  const WeakSubject({super.key});

  @override
  State<WeakSubject> createState() => _WeakSubjectState();
}

class _WeakSubjectState extends State<WeakSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),

              /// HEADER
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: _buildHeader(),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.greyBorder),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.bookimage,
                            height: 245,
                            width: 325,
                          ),

                          const SizedBox(height: 16),

                          const Text(
                            "Boost Your Weak Subjects with Fun Quizzes!",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 16),

                          Text(
                            "Struggling with a tricky topic? Our quiz app turns studying into a game, making it easy to tackle weak subjects and track your progress. Practice with customized quizzes, review answers instantly, and see your improvement with each session. Ready to make learning fun and focused?",
                            style: AppTextStyles.white16,
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 24),

                          /// ADD BUTTON
                          GestureDetector(
                            onTap: _addWeakSubject,
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Add Weak Subject",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// HEADER WIDGET
  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 22,
          ),
        ),
        const Spacer(),
        const Text(
          "Weak Subjects",
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

  void _addWeakSubject() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 18),

                    /// TOP IMAGE
                    Image.asset(AppImages.mode3, height: 80, width: 80),

                    const SizedBox(height: 16),

                    /// TITLE
                    const Text(
                      "Add Exam",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// SELECT EXAM FIELD
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Select Exam",
                          hintText: "AACN CCRN (Adult)",
                          suffixIcon: const Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
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

                    const SizedBox(height: 20),

                    /// SUBJECT HEADING
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Select Subjects",
                            style: AppTextStyles.boldblack16,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// SUBJECT LIST
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _subjectItem("IA. Cardiovascular"),
                          const SizedBox(height: 12),
                          _subjectItem("IB. Hematology"),
                          const SizedBox(height: 12),
                          _subjectItem("IC. Pulmonary"),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// BUTTON SECTION
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
                            child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size(0, 48),
                              ),
                              child: const Text(
                                "Add Weak Subject",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// CLEAN SUBJECT ROW WIDGET
  Widget _subjectItem(String title) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary, width: 1.4),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(title, style: AppTextStyles.smallblack14),
      ],
    );
  }
}
