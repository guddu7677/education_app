// lib/screens/weak_subject_list.dart
import 'package:education_app/constants/app_constant.dart';
import 'package:education_app/services/api_service.dart';
import 'package:flutter/material.dart';

class WeakSubjectList extends StatefulWidget {
  const WeakSubjectList({super.key});

  @override
  State<WeakSubjectList> createState() => _WeakSubjectListState();
}

class _WeakSubjectListState extends State<WeakSubjectList> {
  bool loading = true;
  List<dynamic> subjects = [];
  int examId = 3; // change if needed or pass via constructor

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  Future<void> _loadSubjects() async {
    setState(() {
      loading = true;
    });

    final res = await ApiService().fetchWeakSubjects(examId);

    if (res["success"] == true) {
      setState(() {
        subjects = res["data"] ?? [];
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
      final msg = res["message"]?.toString() ?? "Failed to fetch";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildHeader(),
          _buildMainContent(height),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(AppImages.background, fit: BoxFit.cover),
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
            child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Weak Subject",
                style: AppTextStyles.boldWhite16,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildMainContent(double height) {
    return Positioned(
      top: height * 0.15,
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : subjects.isEmpty
                ? Center(
                    child: Text("No weak subjects found", style: AppTextStyles.black16),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Weak Subject List", style: AppTextStyles.black16),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...subjects.map((item) {
                          final id = item["id"]?.toString() ?? "";
                          final name = item["name"] ?? "N/A";
                          final desc = item["description"] ?? "N/A";
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F9FD),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(name.toString(), style: AppTextStyles.boldblblack14),
                                        const SizedBox(height: 6),
                                        Text(desc.toString(), style: const TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // add delete/edit later
                                    },
                                    icon: const Icon(Icons.delete_outline_outlined, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
      ),
    );
  }
}
