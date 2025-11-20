// lib/screens/weak_subject.dart
import 'package:education_app/CustomButton/bottomNavButton.dart';
import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/services/api_service.dart';
import 'package:education_app/widgets/weak_subject/weak_subject_list.dart';
import 'package:flutter/material.dart';

class WeakSubject extends StatefulWidget {
  const WeakSubject({super.key});

  @override
  State<WeakSubject> createState() => _WeakSubjectState();
}

class _WeakSubjectState extends State<WeakSubject> {
  // Dummy exam list as you requested
  final List<Map<String, dynamic>> exams = [
    {"id": 1, "name": "AACN CCRN (Adult)"},
    {"id": 2, "name": "NCLEX RN"},
    {"id": 3, "name": "IELTS"},
  ];

  // Dummy subjects list (IDs must match backend mapping)
  final List<Map<String, dynamic>> subjects = [
    {"id": 8, "name": "IA. Cardiovascular"},
    {"id": 9, "name": "IB. Hematology"},
    {"id": 10, "name": "IC. Pulmonary"},
  ];

  int? selectedExamId;
  List<int> selectedSubjectIds = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // default to first exam (optional)
    if (exams.isNotEmpty) selectedExamId = exams.first["id"] as int;
  }

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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: _buildHeader(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
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
                          AppButton(
                            title: "Add Weak Subject",
                            onTap: _showAddWeakSubjectDialog,
                            height: 48,
                            color: Colors.white,
                            textColor: AppColors.primary,
                          ),
                          const SizedBox(height: 12),
                          AppButton(
                            title: "View Weak Subject List",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const WeakSubjectList()),
                              );
                            },
                            height: 44,
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

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Text("Weak Subjects", style: AppTextStyles.boldWhite16),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }

  void _showAddWeakSubjectDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        // Use StatefulBuilder so dialog can update state locally
        return StatefulBuilder(builder: (context, setStateDialog) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 18),
                      Image.asset(AppImages.mode3, height: 80, width: 80),
                      const SizedBox(height: 16),
                      const Text(
                        "Add Exam",
                        style: AppTextStyles.semiboldblack20,
                      ),
                      const SizedBox(height: 16),

                      // EXAM DROPDOWN
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButtonFormField<int>(
                          decoration: InputDecoration(
                            labelText: "Select Exam",
                            hintText: "Choose exam",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 14),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          value: selectedExamId,
                          items: exams
                              .map((e) => DropdownMenuItem<int>(
                                    value: e["id"] as int,
                                    child: Text(e["name"] as String),
                                  ))
                              .toList(),
                          onChanged: (v) {
                            setStateDialog(() => selectedExamId = v);
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Header: Select Subjects
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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

                      // SUBJECT ITEMS
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: subjects
                              .map((s) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: _subjectItemWidget(
                                      s["name"] as String,
                                      s["id"] as int,
                                      setStateDialog,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // SUBMIT BUTTON AREA
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
                                title: isLoading
                                    ? "Please wait..."
                                    : "Add Weak Subject",
                                onTap: () async {
                                  if (isLoading) return;

                                  if (selectedExamId == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Please select an exam")),
                                    );
                                    return;
                                  }

                                  if (selectedSubjectIds.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Please select at least one subject")),
                                    );
                                    return;
                                  }

                                  setStateDialog(() => isLoading = true);
                                  setState(() => isLoading = true);

                                  final res = await ApiService().addWeakSubject(
                                    examId: selectedExamId!,
                                    weakSubjects: selectedSubjectIds,
                                  );

                                  setStateDialog(() => isLoading = false);
                                  setState(() => isLoading = false);

                                  if (res["success"] == true) {
                                    // Close dialog and go to list
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const WeakSubjectList()),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Weak subjects added successfully")),
                                    );
                                  } else {
                                    final msg = res["message"]?.toString() ??
                                        "Something went wrong";
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(msg)),
                                    );
                                  }
                                },
                                height: 48,
                                color: Colors.white,
                                textColor: AppColors.primary,
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
        });
      },
    );
  }

  // Subject tile widget inside dialog
  Widget _subjectItemWidget(
      String title, int id, void Function(void Function()) setStateDialog) {
    final isSelected = selectedSubjectIds.contains(id);

    return GestureDetector(
      onTap: () {
        setStateDialog(() {
          setState(() {
            if (isSelected) {
              selectedSubjectIds.remove(id);
            } else {
              selectedSubjectIds.add(id);
            }
          });
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: 1.4,
          ),
          color: isSelected ? AppColors.primary.withOpacity(0.12) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_box : Icons.check_box_outline_blank,
              color: isSelected ? AppColors.primary : Colors.grey,
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(title, style: AppTextStyles.smallblack14)),
          ],
        ),
      ),
    );
  }
}
